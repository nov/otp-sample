class Account < ActiveRecord::Base
  before_validation :setup_opt_seed, on: :create

  private

  def setup_opt_seed
    self.otp_seed = ROTP::Base32.random_base32
  end
end
