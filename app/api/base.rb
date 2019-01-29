module Base
  class API < Grape::API
    format :json
    prefix :api

    mount AdvertController::API
    mount BrandController::API
    mount ModelController::API
    mount UserController::API
  end
end
