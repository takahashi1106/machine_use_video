require "test_helper"

class Public::MachineCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_machine_comments_create_url
    assert_response :success
  end
end
