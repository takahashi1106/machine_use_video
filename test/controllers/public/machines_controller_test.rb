require "test_helper"

class Public::MachinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_machines_index_url
    assert_response :success
  end

  test "should get show" do
    get public_machines_show_url
    assert_response :success
  end
end
