Apiotics.configure do |config|
  # config.public_key = ENV['APIOTICS_PUBLIC_API_KEY']
  # config.private_key = ENV['APIOTICS_PRIVATE_API_KEY']
  config.public_key = "ea3905ae108c605fe21b56622619e488beba0f1a75b9a1874c99d9f36270b06f"
  config.private_key = "47bdb1883ff69a114071c32b2236f09cb41e4918d5b1408da3805a7b292d318e"
  config.local_port = 8001
  config.server_port = 8000
  config.tls = true
  config.verify_peer = true
  config.handshake = true
  config.local_logging = true
end