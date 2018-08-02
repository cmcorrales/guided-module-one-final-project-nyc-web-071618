require 'rest-client'
require 'json'
require 'pry'
offset = 0
@result = []

#while @result["num_results"] > 0 and it threw this error: lib/api_communicator.rb:7:in `[]': no implicit conversion of String into Integer (TypeError)


while offset < 1574 do
  uri = URI("https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?&offset=#{offset}")
  http = Net::HTTP.new(uri.host, uri.port)

  http.use_ssl = true

  uri.query = URI.encode_www_form({
    "api-key" => "5f628fe712a24773937bee868495c7aa",
    "publisher" => "HarperCollins"
  })

  request = Net::HTTP::Get.new(uri.request_uri)
  @result << JSON.parse(http.request(request).body)['results']

  offset += 20
end

# binding.pry
# 0
# uri = URI("https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json")
#
# http = Net::HTTP.new(uri.host, uri.port)
#
# http.use_ssl = true
#
# uri.query = URI.encode_www_form({
#   "api-key" => "5f628fe712a24773937bee868495c7aa",
#   "publisher" => "Penguin"
# })
#
# request = Net::HTTP::Get.new(uri.request_uri)
#
# @result = JSON.parse(http.request(request).body)



# puts @result

# JSON.parse(@result)
