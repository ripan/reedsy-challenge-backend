class CartSerializer
  include JSONAPI::Serializer
  set_id{ nil }

  attribute :total do |object|
    object[:total]
  end

  attribute :items do |object|
    object[:items]
  end
end
