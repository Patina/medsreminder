require 'JSON'
require 'rest-client'

url = 'http://redditcom/top.json'
response = JSON.load(RestClient.get(url))

response["data"]["children"].each_with_index do |story, index| 
	puts "#{index + 1}. #{ story["data"]["title"]}" 
end