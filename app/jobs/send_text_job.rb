# def self.sms_all 
# 	require 'twilio-ruby'
#   	queue_as :default
#  		# Get your Account Sid and Auth Token from twilio.com/user/account
# 		account_sid = 'AC4c974bf72ee8726e5bd51b42dbed0c75'
# 		auth_token = '1098cf21c139fad4503d30e390dceb3e'
# 		@client = Twilio::REST::Client.new account_sid, auth_token
#   		Medicine.all.each do |med|
#  		message = @client.account.messages.create(
#  			:body => body, 
#      		:to => "+16468412893",
#     		:from => "+12013409571")
#  		puts message.to #puts message.sid?
#  	end
#  end