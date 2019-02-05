module BrandController
  class API < Grape::API
    resource :brands do
      desc 'Return brands.'
      get do
        Brand.all
      end

      desc 'Return brand.'
      params do
        requires :id
      end
      route_param :id do
        get do
          Brand.find_by(id: params['id'])
        end
      end
    end
  end
end
