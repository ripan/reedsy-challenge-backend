class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: %i[ show update destroy ]

  # GET /items
  def index
    @items = Item.all

    render json: ItemSerializer.new(@items).serializable_hash.to_json
  end

  # GET /items/1
  def show
    render json: ItemSerializer.new(@item).serializable_hash.to_json
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: ItemSerializer.new(@item).serializable_hash.to_json, status: :created
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: ItemSerializer.new(@item).serializable_hash.to_json
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find_by(code: params[:code])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:code, :name, :price)
    end
end
