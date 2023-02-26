class Api::V1::CartController < ApplicationController
  def create
    render json: CartSerializer.new(
      total: Items::PriceCalculator.call(items: cart_params[:items]),
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
