require File.dirname(__FILE__) + '/test_helper'

class ValidationsTest < Test::Unit::TestCase
  def test_good_email
    user = User.create :email => 'test@example.com'
    assert user.errors.empty?
    assert user.valid?
  end
  
  def test_bad_email
    user = User.create :email => 'test AT example.com'
    assert_not_nil user.errors
    assert ! user.valid?, user.inspect
  end
end
