# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Otp::Application.config.secret_key_base = '85683d4b475c54414cf98395086da3a4bd10f1cb0a9179e8eaaca4a649ca66403abaef41bf5d9384083ed9998e328a2000cc46be185d1af1eae2108cff0b4f59'
