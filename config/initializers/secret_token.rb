# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# use the file
		File.read(token_file).chomp
	else
		# generate a new one
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

# Timothyproffitt::Application.config.secret_key_base = '951ada2b220c0a3f7a66a8970a2de1b9e5606e8fb8a665bb48d67c8ffd74e5a331f3225f7c4932dca0ee88357ccdb9018f5dc6fb24fd85d99efbfb345cb02c6d'
Timothyproffitt::Application.config.secret_key_base = secure_token