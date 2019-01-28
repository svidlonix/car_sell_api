module Base
  class API < Grape::API
    format :json
    prefix :api

    mount Ad::API
    mount Brand::API
    mount Type::API
    mount User::API
  end
end