require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "renders the checkout demonstration" do
    get checkout_url, params: { product_id: @product.id }

    assert_response :success
    assert_select "strong", "これは決済デモです。"
  end

  test "accepts only the designated test card and does not create a purchase" do
    assert_no_difference("Product.count") do
      post checkout_preview_url, params: {
        checkout: {
          agreement: "1", card_number: "4242 4242 4242 4242", cardholder_name: "GOLDEN POT DEMO",
          cvc: "123", expiry_date: "12 / 30", product_id: @product.id
        }
      }
    end

    assert_response :success
    assert_select "h1", "購入は完了していません。"
    assert_select "dd", "デモ表示のみ（決済なし）"
  end

  test "rejects a non-demo card number" do
    post checkout_preview_url, params: {
      checkout: { agreement: "1", card_number: "4111 1111 1111 1111", cardholder_name: "DO NOT USE", cvc: "123", expiry_date: "12 / 30", product_id: @product.id }
    }

    assert_response :unprocessable_content
    assert_select ".form-errors"
  end
end
