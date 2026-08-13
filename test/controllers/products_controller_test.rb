require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "shows the catalogue" do
    get products_url

    assert_response :success
    assert_select ".material-story", count: 3
  end

  test "filters products by material" do
    get products_url, params: { material: "金" }

    assert_response :success
    assert_select "h3", text: "金の大壺", count: 1
    assert_select "h3", text: "銀の小壺", count: 0
  end

  test "shows a product" do
    get product_url(@product)

    assert_response :success
    assert_select "a", /デモ購入フローへ/
  end
end
