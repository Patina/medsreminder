class SendTextJob < ActiveJob::Base

	def perform(medicine)
		#Get your Account Sid and Auth Token from twilio.com/user/account
		account_sid = ENV['TWILIO_SID']
		auth_token = ENV['TWILIO_AUTH']
		from_number = ENV['TWILIO_NUMBER']

		@client = Twilio::REST::Client.new account_sid, auth_token
  		Medicine.all.each do |med|
	 		message = @client.account.messages.create(
	 			:body => body, 
	     		:to => "medicine.user.telephone_number",
	    		:from => from_number)
	 		puts message.to #puts message.sid?
 		end
	end


end