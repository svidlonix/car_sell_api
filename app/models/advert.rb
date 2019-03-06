class Advert
  include Mongoid::Document
  include MongoidEnumerable
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  field :engine, type: String
  field :conditioner, type: Boolean
  field :condition, type: Boolean
  field :price, type: Float
  field :distance_covered, type: String
  field :year, type: String
  field :color, type: String
  field :description, type: String
  field :picture, type: String

  belongs_to :model
  belongs_to :user

  enumerable :wheel, [:left, :right]
  enumerable :type, [:car, :bike, :truck]
  enumerable :fuel, [:diesel, :petrol, :hybrid, :electro]
  enumerable :transmission, [:manual, :automatic]

  embeds_many :pictures

  def model_name
    model.name
  end

  def brand_name
    model.brand.name
  end

  def created_date
    created_at.strftime("%m/%d/%Y")
  end
end
