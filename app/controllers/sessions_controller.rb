class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.jti.present?
      token = JWT.encode(resource.jwt_payload, ENV['SECRET_KEY_BASE'], 'HS256')
      render json: { 'token' => token, 'user_id' => resource.id.to_s }
    else
      render status: :unauthorized
    end
  end

  def respond_to_on_destroy
    decoded_token = JWT.decode(params['token'], ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' }).first['jti']
    resource = User.find_by(jti: decoded_token)
    resource.update(jti: SecureRandom.uuid)
    render json: { 'message' => 'Successfully logout' }
  rescue Exception
    render json: { "message": "Invalid token" }, status: 422
  end
end
