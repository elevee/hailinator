require "twitter"
require "csv"
require 'fileutils'

Twitter.configure do |config| # AUTHENTICATION
  config.consumer_key = ENV[CONSUMER_KEY]
  config.consumer_secret = ENV[CONSUMER_SECRET]
  config.oauth_token = ENV[OAUTH_TOKEN]
  config.oauth_token_secret = ENV[OAUTH_TOKEN]
end

puts Twitter.search("hi", :count => 3, :result_type => "recent").results.inspect # TWITTER::TWEETS Class

FileUtils.touch('file.csv')

results = Twitter.search("hi", :count => 3, :result_type => "recent").results


CSV.open("file.csv", "wb") do |csv| # OPEN CSV
	csv << ["handle", "text", "url"] # CREATE HEADERS
	results.each do | status |
		puts "#{status.from_user}: #{status.text}: http://www.twitter.com/#{status.from_user}/status/#{status.id}" #get inside each tweet object and get handle, text, url
		csv << ["#{status.from_user}", "#{status.text}, http://www.twitter.com/#{status.from_user}/status/#{status.id}"]
	end
end
