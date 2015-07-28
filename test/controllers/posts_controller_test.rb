require 'test_helper'
require 'benchmark/ips'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "show" do
    get post_url(@post)
    assert_response :ok
  end

  test "show bm" do
    Benchmark.ips(5) do |bm|
      bm.report 'Running test...' do
        get post_url(@post)
        assert_response :ok
      end
    end
  end
end
