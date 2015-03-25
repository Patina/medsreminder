class SendEmailJob < ActiveJob::Base
  require 'mandrill'
  queue_as :default

  def perform(medicine)
  	# Reminder.medicine(Medicine.last).deliver_now
    #:send_at => medicine.reminder_time
    def perform(medicine)
    #:send_at => medicine.reminder_time
    m = Mandrill::API.new 
		message = {
		:subject=> "Message from Meds Reminder", 
		:from_name=> "Jane@MedsReminder.com",
		:text=> "",
		:to=>[
			{
			:email=> medicine.user.email,
			:name=> medicine.user.First_name
			}
			],
		:html=>"",
		:from_email=>''
		} 
		sending = m.messages.send message
		puts sending
  		end
	end
end
