class SendEmailJob < ActiveJob::Base
  require 'mandrill'
  queue_as :default

  def perform(medicine)
    #:send_at => medicine.reminder_time
    m = Mandrill::API.new 
		message = {
		:subject=> "Message from Meds Reminder", 
		:from_name=> "Jane@MedsReminder.com",
		:text=> "You are receiving this email because you asked MedsReminder to remind you to take your #{medicine.name}. It is now #{medicine.reminder_time}. Please take #{medicine.name}. This is more likely to be effective if you follow your doctor’s or pharmacist’s exact instructions on when and how to take it. Medication Reminder is here to help you organize your medication list for a better health outcome. If you have any questions or concerns regarding your medication, please discuss with your doctor.",
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
