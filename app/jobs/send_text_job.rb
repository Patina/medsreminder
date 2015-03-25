class SendTextJob < ActiveJob::Base

	def perform(medicine)
		#Get your Account Sid and Auth Token from twilio.com/user/account

		@client = Twilio::REST::Client.new account_sid, auth_token
  		Medicine.all.each do |med|
	 		message = @client.account.messages.create(
	 			:body => body, 
	     		:to => "medicine.user.telephone_number",
	    		:from => "+12013409571")
	 		puts message.to #puts message.sid?
 		end
	end


end