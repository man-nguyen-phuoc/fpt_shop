require "test_helper"

class ManufacturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get manufactures_index_url
    assert_response :success
  end
end
