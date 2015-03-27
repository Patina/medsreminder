class Medicine < ActiveRecord::Base
	validates :name, presence: true
	belongs_to :user

	require 'mandrill'

	def delivery_time
		(self.reminder_time.hour * 60) + self.reminder_time.min
	end

	def text_user
		account_sid = ENV['TWILIO_SID']
		auth_token = ENV['TWILIO_AUTH']
		from_number = ENV['TWILIO_NUMBER']
		@client = Twilio::REST::Client.new account_sid, auth_token
		body = "Please take your #{self.name} now."
 		message = @client.account.messages.create(
 			:body => body, 
     		:to => self.user.telephone_number,
    		:from => from_number)
 		puts message.to #puts message.sid?
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



