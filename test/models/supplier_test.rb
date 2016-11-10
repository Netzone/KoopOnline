require 'test_helper'

class SupplierTest < ActiveSupport::TestCase
   test "should not create new supplier without user_id" do
     supplier = Supplier.new({name:'test', email:'d', address:'d', city:'d', website:'d', phone:'d'})
     assert_not supplier.save
   end

  test "should create new supplier" do
    supplier = Supplier.new({name:'test', email:'d', address:'d', city:'d', website:'d', phone:'d', user_id: users(:tom).id, all_tags:'meat,deli'})
    assert supplier.save
  end
  test "should not create new supplier without address" do
    supplier = Supplier.new({name:'test', email:'d', address:'', city:'d', website:'d', phone:'d', user_id: users(:tom).id})
    assert_not supplier.save
  end
   test "should not create new supplier without name" do
     supplier = Supplier.new({name:'', email:'d', address:'d', city:'d', website:'d', phone:'d', user_id: users(:tom).id})
     assert_not supplier.save
   end
   test "should not create new supplier without email" do
     supplier = Supplier.new({name:'test', email:'', address:'d', city:'d', website:'d', phone:'d', user_id: users(:tom).id})
     assert_not supplier.save
   end
   test "should not create new supplier without city" do
     supplier = Supplier.new({name:'test', email:'d', address:'d', city:'', website:'d', phone:'d', user_id: users(:tom).id})
     assert_not supplier.save
   end
   test "should not create new supplier without website" do
     supplier = Supplier.new({name:'test', email:'d', address:'d', city:'d', website:'', phone:'d', user_id: users(:tom).id})
     assert_not supplier.save
   end
   test "should not create new supplier without phone" do
     supplier = Supplier.new({name:'test', email:'d', address:'d', city:'d', website:'d', phone:'', user_id: users(:tom).id})
     assert_not supplier.save
   end

end
