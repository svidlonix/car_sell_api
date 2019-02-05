class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    token = JWT.encode(resource.jwt_payload, Devise.secret_key, 'HS256')
    render json: { 'token' => token }
  end

  def respond_to_on_destroy
    decoded_token = JWT.decode(params['user']['token'], Devise.secret_key, true, { algorithm: 'HS256' }).first['jti']
    resource = User.find_by(jti: decoded_token)
    resource.update(jti: SecureRandom.uuid)
    render json: { 'message' => 'Successfully logout' }
  rescue Exception
    render json: { "message": "Invalid token" }, status: 422
  end
end
