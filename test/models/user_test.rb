require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid user" do
    hash = {email: 'koop@koop.se',
            password: 'admin123',
            address:'Vintergatan 7',
            city: 'Jönköping',
            password_confirmation: 'admin123'}
    user = User.new hash
    assert user.valid?
  end

  test "should not save user without address" do
    hash = {email: 'koop@koop.se',
            password: 'admin123',
            address:'',
            city: 'Jönköping',
            password_confirmation: 'admin123'}
    user = User.new hash
    assert_not user.valid?
  end

  test "should not save user without city" do
    hash = {email: 'koop@koop.se',
            password: 'admin123',
            address:'Vintergatan 7',
            city: '',
            password_confirmation: 'admin123'}
    user = User.new hash
    assert_not user.valid?
  end
end
