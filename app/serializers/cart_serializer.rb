class CartSerializer
  include JSONAPI::Serializer
  set_id{ nil }

  attribute :total do |object|
    object[:total]
  end

  attribute :total_price do |object|
    object[:total_price]
  end

  attribute :total_discount do |object|
    object[:total_discount]
  end

  attribute :items do |object|
    object[:items]
  end
end
