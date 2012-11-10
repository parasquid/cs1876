class Keyword < Ohm::Model
  attribute :entry
  index :entry
  reference :property, :Property
end
