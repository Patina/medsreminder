namespace :medicines do
	
	#This is being used to schedule emails
	desc "This task is called by the Heroku scheduler add-on"
	task :send => :environment do
	  puts "Sending emails"
	  	Medicine.all.each do |medicine|
			Reminder.medicine(medicine).deliver_later(wait: medicine.delivery_time.minutes)	
		end
	  puts "done."
	end

	desc "This is to schedule a test email and text message."
	task :test_later => :environment do
		Reminder.medicine(Medicine.first).deliver_later(wait: 1.minute)
		SendTextJob.set(wait: 1.minute).perform_later(Medicine.first)
		puts "Tests scheduled. :)"	
	end

	desc "This is to schedule a test email and text message."
	task :test_now => :environment do
		Reminder.medicine(Medicine.first).deliver_now
		SendTextJob.perform_later(Medicine.first)
		puts "Tests ran. :)"	
	end
end
# 	task :text => :environment do
# 	Medicine.all.each do |medicine|
# 		SendTextJob.set(wait: medicine.delivery_time.minutes).perform_later(medicine)	
	
# 	end
# end



