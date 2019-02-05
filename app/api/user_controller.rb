module UserController
  class API < Grape::API

    resource :users do
      desc 'Return users.'
      get do
        User.all
      end

      desc 'Return type.'
      params do
        requires :id
      end
      route_param :id do
        get do
          User.find_by(id: params['id'])
        end
      end
    end
  end
end
