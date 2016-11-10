require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
   test "should not create new supplier without user_id" do
     supplier = Supplier.new({name:'test', email:'d', address:'d', city:'d', website:'d', phone:'d'})
     assert_not supplier.save
   end
end
