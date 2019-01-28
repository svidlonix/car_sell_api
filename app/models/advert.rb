class Advert
  include Mongoid::Document
  include Mongoid::Enum

  field :engine, type: String
  field :conditioner, type: Boolean
  field :condition, type: Boolean
  field :price, type: Float
  field :distance_covered, type: String
  field :year, type: String
  field :color, type: String

  belongs_to :model
  belongs_to :user

  enum :wheel, [:left, :right]
  enum :type, [:car, :bikes, :trucks]
  enum :fuel, [:diesel, :petrol]
  enum :transmission, [:manual, :automatic]
end
