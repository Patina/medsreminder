namespace :medicines do
	
	desc "This task is called by the Heroku scheduler add-on"
	task :send => :environment do
	  puts "Sending emails"
	  	Medicine.all.each do |medicine|
			SendEmailJob.set(wait: medicine.delivery_time.minutes).perform_later(medicine)	
		end
	  puts "done."
	end

# 	task :text => :environment do
# 	Medicine.all.each do |medicine|
# 		SendTextJob.set(wait: medicine.delivery_time.minutes).perform_later(medicine)	
	
# 	end
# end



