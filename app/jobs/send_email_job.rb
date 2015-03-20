class SendEmailJob < ActiveJob::Base
  require 'mandrill'
  queue_as :default

  def perform(medicine)
    # Do something later
    #:send_at => medicine.reminder_time
    m = Mandrill::API.new 
		message = {
		:subject=> "Message from Meds Reminder", 
		:from_name=> "Jane@MedsReminder.com",
		:text=> "Take Your #{medicine.name} Now! Do Not Forget!",
		:to=>[
			{
			:email=> medicine.user.email,
			:name=> medicine.user.First_name
			}
			],
		:html=>"<html><h1>Take Your #{medicine.name} Now! Do Not Forget!</h1></html>",
		:from_email=>'medsreminder@medsreminder.com'
		} 
		sending = m.messages.send message
		puts sending
  	end
end
