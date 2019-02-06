module Base
  class API < Grape::API
    format :json
    prefix :api

    before do
      error!('401 Unauthorized', 401)  unless authenticated
    end

    helpers do
      def authenticated
        return unless request.headers['Authorization'].present?
        decoded_token = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' }).first['jti']
        @user = User.find_by(jti: decoded_token)
      end

      def current_user
        @user
      end
    end

    mount AdvertController::API
    mount BrandController::API
    mount ModelController::API
    mount UserController::API
  end
end
