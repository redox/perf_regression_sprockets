require 'test_helper'
require 'objspace'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "show" do
    @post = posts(:one)
    get post_url(@post)
    assert_response :ok
  end
end

Minitest.run_one_method(PostsIntegrationTest, 'test_index')

# ruby -Ilib:test test/controllers/posts_stackprof_test.rb
ObjectSpace::AllocationTracer.setup(%i{path line type})
result = ObjectSpace::AllocationTracer.trace do
  3000.times do
    Minitest.run_one_method(PostsIntegrationTest, 'test_show')
  end
end

result.sort_by { |info, counts| counts.first }.reverse.first(5).each do |r|
  p r
end
