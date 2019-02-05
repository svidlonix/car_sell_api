module AdvertController
  class API < Grape::API
    resource :cars do
      desc 'Return cars.'
      get do
        Advert.all
      end

      desc 'Return car.'
      params do
        requires :id
      end
      route_param :id do
        get do
          Advert.find_by(id: params['id'])
        end
      end
    end
  end
end
