require 'net/http'
require 'uri'

def post_request(url, body_params = {})
  uri = URI.parse(url)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  request = Net::HTTP::Post.new(uri.request_uri)
  request.set_form_data(body_params)

  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  puts response.body
end
