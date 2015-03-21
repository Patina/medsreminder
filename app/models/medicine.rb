class Medicine < ActiveRecord::Base
	require 'mandrill'
	belongs_to :user

	def delivery_time
		(self.reminder_time.hour * 60) + self.reminder_time.min
	end

	def remind_user
		m = Mandrill::API.new 
		message = {
		:subject=> "Message from Meds Reminder", 
		:from_name=> "Jane@MedsReminder.com",
		:text=> "Take Your Medicine Now! Do Not Forget!",
		:to=>[
			{
			:email=> self.user.email,
			:name=> self.user.First_name
			}
			],
		:html=>"<html><h1>Take Your Medicine Now! Do Not Forget!</h1></html>",
		:from_email=>'medsreminder@medsreminder.com'
		} 
		sending = m.messages.send message
		puts sending
	end
end

 # def self.sms_all 
 # 		# Get your Account Sid and Auth Token from twilio.com/user/account
	# 	account_sid = 'AC4c974bf72ee8726e5bd51b42dbed0c75'
	# 	auth_token = '1098cf21c139fad4503d30e390dceb3e'
	# 	@client = Twilio::REST::Client.new account_sid, auth_token
 #  		Medicine.all.each do |med|
 # 		message = @client.account.messages.create(
 # 			:body => body, 
 #     		:to => "+16468412893",
 #    		:from => "+12013409571")
 # 		puts message.to #puts message.sid?
 # 	end
 # end

