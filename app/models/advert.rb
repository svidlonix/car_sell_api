class Advert
  include Mongoid::Document
  include MongoidEnumerable

  field :engine, type: String
  field :conditioner, type: Boolean
  field :condition, type: Boolean
  field :price, type: Float
  field :distance_covered, type: String
  field :year, type: String
  field :color, type: String

  belongs_to :model
  belongs_to :user

  enumerable :wheel, [:left, :right]
  enumerable :type, [:car, :bikes, :trucks]
  enumerable :fuel, [:diesel, :petrol]
  enumerable :transmission, [:manual, :automatic]
end
