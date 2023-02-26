require "rails_helper"

RSpec.describe "Cart", type: :request do
  let(:valid_attributes) do
    {
      items: [
        {
          code: "MUG",
          quantity: 2
        },
        {
          code: "TSHIRT",
          quantity: 4
        },
        {
          code: "HOODIE",
          quantity: 1
        }
      ]
    }
  end

  let(:invalid_attributes) do
    {
      items: [
        {
          code: "XYZ",
          quantity: 2
        }
      ]
    }
  end

  let(:valid_headers) do
    {}
  end

  let!(:item_1){ create :item, code: "MUG", price: 6.00 }
  let!(:item_2){ create :item, code: "TSHIRT", price: 15.00 }
  let!(:item_3){ create :item, code: "HOODIE", price: 20.00 }

  describe "POST /api/v1/cart" do
    context "with valid parameters" do
      it "renders a JSON response with the new item" do
        post api_v1_cart_index_url,
             params: { cart: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(json_body).to eq(
          {
            data: {
              attributes: {
                items: valid_attributes[:items],
                total: 92.0
              },
              id: nil,
              type: "cart"
            }
          }
        )
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the new item" do
        post api_v1_cart_index_url,
             params: { cart: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(json_body).to eq(
          {
            error: {
              message: "invalid cart"
            }
          }
        )
      end
    end
  end
end
