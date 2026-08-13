require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "filters products by material" do
    get products_url, params: { material: "金" }

    assert_response :success
    assert_select "h3", text: "金の大壺", count: 1
    assert_select "h3", text: "銀の小壺", count: 0
  end

  test "should get new" do
    get new_product_url, headers: admin_auth_headers
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, headers: admin_auth_headers, params: { product: { description: @product.description, material: @product.material, name: @product.name, price: @product.price, size: @product.size } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "requires authentication to create a product" do
    post products_url, params: { product: { description: @product.description, material: @product.material, name: @product.name, price: @product.price, size: @product.size } }

    assert_response :unauthorized
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product), headers: admin_auth_headers
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), headers: admin_auth_headers, params: { product: { description: @product.description, material: @product.material, name: @product.name, price: @product.price, size: @product.size } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product), headers: admin_auth_headers
    end

    assert_redirected_to products_url
  end
end
