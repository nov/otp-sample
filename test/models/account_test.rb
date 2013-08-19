require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def test_setup_otp_seed
    new_account = Account.new
    assert_nil new_account.otp_seed
    assert new_account.valid?
    assert new_account.otp_seed
  end
end
