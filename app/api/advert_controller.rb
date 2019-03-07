module AdvertController
  class API < Grape::API
    resource :adverts do
      before { authenticated! }
      desc 'Return cars.'
      params do
        requires :limit
      end
      get do
        Array(Advert.all.limit(params['limit']).as_json(only: [:picture, :price, :fuel, :type, :distance_covered, :transmission, :year], methods:[:model_name, :brand_name, :created_date]))
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

      desc 'Create adverts.'
      params do
        requires :engine, type: String
        requires :price, type: String
        requires :distance_covered, type: String
        requires :year, type: String
        requires :description, type: String
        requires :type_selected, type: String
        requires :condition_selected, type: String
        requires :wheel_selected, type: String
        requires :conditioner_selected, type: String
        requires :fuel_selected, type: String
        requires :color, type: String
        requires :picture, type: String
        requires :model, type: String
      end
      post do
        Advert.create(
          engine: params[:engine],
          price: params[:price].to_i,
          distance_covered: params[:distance_covered].to_i,
          year: params[:year].to_i,
          description: params[:description].to_i,
          type: params[:type_selected],
          condition: params[:condition_selected],
          wheel: params[:wheel_selected],
          conditioner: params[:conditioner_selected],
          fuel: params[:fuel_selected],
          color: params[:color],
          picture: params[:picture],
          model: Model.find(params[:model]),
          user: User.last
        )
      end
    end

    namespace :get_brands do
      desc 'Get brand.'
      get do
        Brand.all.map { |brand| { value: brand.id.to_s, text: brand.name } }
      end
    end

    namespace :get_models do
      desc 'Get brand.'
      get do
        Brand.find(params[:id]).models.map { |model| { value: model.id.to_s, text: model.name } }
      end
    end
  end
end
