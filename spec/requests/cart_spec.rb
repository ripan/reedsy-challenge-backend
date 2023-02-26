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
      context "without discount" do
        it "renders a JSON response with price calculation" do
          post api_v1_cart_index_url,
              params: { cart: valid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(json_body).to eq(
            {
              data: {
                attributes: {
                  items: valid_attributes[:items],
                  total: 92.0,
                  total_price: 92.0,
                  total_discount: 0
                },
                id: nil,
                type: "cart"
              }
            }
          )
        end
      end

      context "with discount" do
        let(:valid_attributes) do
          {
            items: [
              {
                code: "MUG",
                quantity: 200
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

        tshirt_discount_1 = FactoryBot.build :discount, quantity: 3, percentage: 30
        mug_discount_1 = FactoryBot.build :discount, quantity: 10, percentage: 2
        mug_discount_2 = FactoryBot.build :discount, quantity: 20, percentage: 4
        mug_discount_3 = FactoryBot.build :discount, quantity: 30, percentage: 6
        mug_discount_4 = FactoryBot.build :discount, quantity: 40, percentage: 8
        mug_discount_5 = FactoryBot.build :discount, quantity: 50, percentage: 10
        mug_discount_6 = FactoryBot.build :discount, quantity: 150, percentage: 30

        before do
          item_2.discounts = [tshirt_discount_1]

          item_1.discounts = [
            mug_discount_1,
            mug_discount_2,
            mug_discount_3,
            mug_discount_4,
            mug_discount_5,
            mug_discount_6
          ]
        end

        it "renders a JSON response with price calculation" do
          post api_v1_cart_index_url,
              params: { cart: valid_attributes }, headers: valid_headers, as: :json
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to match(a_string_including("application/json"))
          expect(json_body).to eq(
            {
              data: {
                attributes: {
                  items: valid_attributes[:items],
                  total: 902.00,
                  total_price: 1280.00,
                  total_discount: 378.00
                },
                id: nil,
                type: "cart"
              }
            }
          )
        end
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the price calculation" do
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
