# SQUARE_CONFIG = YAML.load_file("#{::Rails.root}/config/square.yml")[::Rails.env]
# @square = Square::OAuth2::Client.new(
#   SQUARE_CONFIG['square_id'],
#   SQUARE_CONFIG['square_secret']
#   # redirect_uri: 'https://example.client.com/callback'
# )

## Authorization Request

## Token Request
# client.authorization_code = '<your-authorization-code>'
# access_token = client.access_token!
