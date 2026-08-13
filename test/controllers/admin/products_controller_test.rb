require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_products_url, headers: admin_auth_headers
    assert_response :success
  end

  test "creates a product with administrator authentication" do
    assert_difference("Product.count") do
      post admin_products_url, headers: admin_auth_headers, params: { product: { description: "説明", material: "金", name: "新しい壺", price: 1_000_000, size: "中" } }
    end

    assert_redirected_to admin_products_url
  end

  test "requires authentication to create a product" do
    post admin_products_url, params: { product: { description: "説明", material: "金", name: "新しい壺", price: 1_000_000, size: "中" } }

    assert_response :unauthorized
  end
end
