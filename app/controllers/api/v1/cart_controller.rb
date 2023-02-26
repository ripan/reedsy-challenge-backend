class Api::V1::CartController < ApplicationController
  def create
    price = Items::PriceCalculator.call(items: cart_params[:items])
    render json: CartSerializer.new(
      total: price[:total],
      total_price: price[:total_price],
      total_discount: price[:total_discount],
      items: cart_params[:items]
    ).serializable_hash.to_json, status: :ok
  rescue StandardError
    render json: { error: { message: "invalid cart" } }, status: :unprocessable_entity
  end

  private

  # Only allow a list of trusted parameters through.
  def cart_params
    params.require(:cart).permit(items: %I[code quantity])
  end
end
