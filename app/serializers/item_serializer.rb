class ItemSerializer
  include JSONAPI::Serializer
  set_id :code
  attributes :code, :name, :price
end
