require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
   test "should not create new supplier without address" do
     supplier = Supplier.new
     assert_not supplier.save
   end
end
