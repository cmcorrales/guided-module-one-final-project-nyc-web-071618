require 'rest-client'
require 'json'
require 'pry'

uri = URI("https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json")

http = Net::HTTP.new(uri.host, uri.port)

http.use_ssl = true

uri.query = URI.encode_www_form({
  "api-key" => "5f628fe712a24773937bee868495c7aa",
  "publisher" => "Penguin"
})

request = Net::HTTP::Get.new(uri.request_uri)

@result = JSON.parse(http.request(request).body)



# puts @result

# JSON.parse(@result)
