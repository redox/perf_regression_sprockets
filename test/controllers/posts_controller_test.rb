require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "show" do
    get post_url(@post)
    assert_response :ok
  end
end
