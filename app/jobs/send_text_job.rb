class SendTextJob < ActiveJob::Base

	def perform(medicine)
		#Get your Account Sid and Auth Token from twilio.com/user/account
		medicine.text_user
	end


end