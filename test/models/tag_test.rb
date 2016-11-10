require 'test_helper'

class TagTest < ActiveSupport::TestCase
   test "should not create tag without tag name" do
     tag = Tag.new({tag:''})
     assert_not tag.save
   end
end
