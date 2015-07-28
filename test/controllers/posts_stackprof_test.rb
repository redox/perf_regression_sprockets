require 'test_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "show" do
    @post = posts(:one)
    get post_url(@post)
    assert_response :ok
  end
end

Minitest.run_one_method(PostsIntegrationTest, 'test_index')

# ruby -Ilib:test test/controllers/posts_stackprof_test.rb
StackProf.run(mode: :wall, out: 'graphs/show_integration_stackprof.dump') do
  3000.times do
    Minitest.run_one_method(PostsIntegrationTest, 'test_show')
  end
end
