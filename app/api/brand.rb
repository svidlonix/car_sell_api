module Brand
  class API < Grape::API
    resource :brands do
      desc 'Return brands.'
      get do
        [{ id: 1, name: 'Audi' }, { id: 2, name: 'Ford' }, { id: 3, name: 'Skoda' }]
      end

      desc 'Return brand.'
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          { id: 1, name: 'Audi' }
        end
      end
    end
  end
end