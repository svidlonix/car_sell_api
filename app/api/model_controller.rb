module ModelController
  class API < Grape::API
    resource :models do
      desc 'Return models.'
      get do
        Model.all
      end

      desc 'Return model.'
      params do
        requires :id
      end
      route_param :id do
        get do
          Model.find_by(id: params['id'])
        end
      end
    end
  end
end
