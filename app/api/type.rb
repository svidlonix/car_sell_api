module Type
  class API < Grape::API
    resource :types do
      desc 'Return types.'
      get do
        [{ id: 1, name: 'Cars' }, { id: 2, name: 'Bikes' }, { id: 3, name: 'Trucks'}]
      end

      desc 'Return type.'
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          { id: 1, name: 'Cars' }
        end
      end
    end
  end
end