require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_url, headers: admin_auth_headers
    assert_response :success
  end

  test "requires authentication" do
    get admin_dashboard_url
    assert_response :unauthorized
  end
end
