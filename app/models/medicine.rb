class Medicine < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :user

	require 'mandrill'

	def delivery_time
		(self.reminder_time.hour * 60) + self.reminder_time.min
	end

	def remind_user
		m = Mandrill::API.new 
		message = {
		:subject=> "Message from Meds Reminder", 
		:from_name=> "Jane@MedsReminder.com",
		:text=> "",
		:to=>[
			{
			:email=> self.user.email,
			:name=> self.user.First_name
			}
			],
		:html=>"",
		:from_email=>'medsreminder@medsreminder.com'
		} 
		sending = m.messages.send message
		puts sending
	end
end



