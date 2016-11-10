require 'test_helper'

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::ControllerHelpers
  setup do
    @supplier = Supplier.first
    sign_in User.first
  end

  test "should get index" do
    get suppliers_path
    assert_response :success
  end

  test "should get new" do
    get new_supplier_path
    assert_response :success
  end

  test "should create supplier" do
    assert_difference('Supplier.count') do
      post supplier_path, params: { supplier: { name:'test', email:'d', address:'d', city:'d', website:'d', phone:'d', user_id: users(:tom).id } }
    end

    assert_redirected_to supplier_path(Supplier.last)
  end

  test "should show supplier" do
    get supplier_path(@supplier)
    assert_response :success
  end

  test "should get edit" do
    get edit_supplier_path(@supplier)
    assert_response :success
  end

  test "should update supplier" do
    patch supplier_path(@supplier), params: { supplier: { name:'test', email:'d', address:'d', city:'d', website:'d', phone:'d', user_id: users(:tom).id } }
    assert_redirected_to supplier_path(@supplier)
  end

  test "should destroy supplier" do
    assert_difference('Supplier.count', -1) do
      delete supplier_path(@supplier)
    end

    assert_redirected_to suppliers_path
  end
end
