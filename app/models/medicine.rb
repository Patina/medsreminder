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

