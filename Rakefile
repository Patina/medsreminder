# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :medicines do

  desc "Send all the medicine reminders."
  task :send => :environment do

  	# AND sent IS false do not forget
  	# designed to run at midnight
	Medicine.all.each do |medicine|
		SendEmailJob.set(wait: medicine.delivery_time.minutes).perform_later(medicine)	
	end

  end
end
#&& sent == false
