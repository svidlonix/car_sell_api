module AdvertController
  class API < Grape::API
    resource :cars do
      before { authenticated! }
      desc 'Return cars.'
      params do
        requires :limit
      end
      get do
        Array(Advert.all.limit(params['limit']).as_json(only: [:price, :fuel, :type, :distance_covered, :transmission, :year], methods:[:model_name, :brand_name, :main_picture_base64, :created_date]))
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
