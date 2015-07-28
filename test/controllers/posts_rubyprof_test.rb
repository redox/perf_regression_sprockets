require 'test_helper'

class PostsIntegrationTest < ActionDispatch::IntegrationTest
  test "show" do
    @post = posts(:one)
    get post_url(@post)
    assert_response :ok
  end
end

# ruby -Ilib:test test/controllers/posts_stackprof_test.rb
result = RubyProf.profile do
  Minitest.run_one_method(PostsIntegrationTest, 'test_index')
end

File.open('graphs/show_rubyprof_callstack.html', 'w') do |file|
  RubyProf::CallStackPrinter.new(result).print(file)
end
