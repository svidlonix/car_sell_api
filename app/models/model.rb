class Model
  include Mongoid::Document
  field :name, type: String

  belongs_to :brand
end
