require 'rest-client'
require 'json'
require 'pry'
require_relative '../api-key.rb'


#while @result["num_results"] > 0 and it threw this error: lib/api_communicator.rb:7:in `[]': no implicit conversion of String into Integer (TypeError)

uri = URI("https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
uri.query = URI.encode_www_form({
  "api-key" => "c7a7671f745945b081899c66eb5f6a47",
  "publisher" => "Bloomsbury"
})
request = Net::HTTP::Get.new(uri.request_uri)
@result = JSON.parse(http.request(request).body)
