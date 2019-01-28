module Ad
  class API < Grape::API
    resource :cars do
      desc 'Return cars.'
      get do
        [{ id: 1, brand: 'Audi', model: 'A4', year: '2008' }, { id: 2, name: 'Audi', brand: 'A6', year: '2008' }, { id: 3, name: 'Audi', brand: 'A8', year: '2008' }]
      end

      desc 'Return car.'
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          { id: 1, brand: 'Audi', model: 'A4', year: '2008' }
        end
      end
    end
  end
end