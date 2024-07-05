require 'net/http'
require 'uri'

def get_request(url)
  uri = URI.parse(url)

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  request = Net::HTTP::Get.new(uri.request_uri)

  response = http.request(request)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  puts response.body
end
