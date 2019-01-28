module User
  class API < Grape::API
    resource :users do
      desc 'Return users.'
      get do
        [{ id: 1, name: 'Antony', email: 'aaa@aaa.com' }, { id: 2, name: 'Tony', email: 'bbb@bbb.com' }, { id: 3, name: 'Jone', email: 'ccc@ccc.com' }]
      end

      desc 'Return type.'
      params do
        requires :id, type: Integer
      end
      route_param :id do
        get do
          { id: 1, name: 'Antony', email: 'aaa@aaa.com' }
        end
      end
    end
  end
end