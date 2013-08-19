class Account < ActiveRecord::Base
  validates :identifier, presence: true, uniqueness: true
  validates :otp_seed,   presence: true

  before_validation :setup_otp_seed, :setup_identifier, on: :create

  def self.authenticate(credentials)
    identifier, otp = credentials[:identifier], credentials[:otp]
    account = where(identifier: identifier).first
    if account.try(:otp_verifier).try(:verify, otp)
      account
    else
      nil
    end
  end

  def provisioning_uri(mode = :url_string)
    provisioning_uri = otp_verifier.provisioning_uri Rails.application.class.name
    case mode
    when :qr_code
      data = Rack::Utils.escape(provisioning_uri)
      "https://chart.googleapis.com/chart?chs=200x200&chld=M|0&cht=qr&chl=#{data}"
    else
      provisioning_uri
    end
  end

  def otp_verifier
    ROTP::TOTP.new otp_seed
  end

  private

  def setup_identifier
    self.identifier = SecureRandom.hex 8 if identifier.blank?
  end

  def setup_otp_seed
    self.otp_seed = ROTP::Base32.random_base32
  end
end
