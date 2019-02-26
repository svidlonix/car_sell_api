module Base
  class API < Grape::API
    format :json
    prefix :api

    helpers do
      def authenticated!
        return error!('401 Unauthorized', 401) unless request.headers['Authorization'].present?
        decoded_token = JWT.decode(request.headers['Authorization'], ENV['SECRET_KEY_BASE'], true, { algorithm: 'HS256' }).first['jti']
        @user = User.find_by(jti: decoded_token)
        error!('401 Unauthorized', 401) unless @user
      end

      def current_user
        @user
      end
    end

    mount AdvertController::API
    mount BrandController::API
    mount ModelController::API
    mount ProfileController::API
  end
end
