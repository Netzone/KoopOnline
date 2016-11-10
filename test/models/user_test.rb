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
end
