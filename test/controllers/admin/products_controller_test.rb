require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_products_url, headers: admin_auth_headers
    assert_response :success
  end
end
