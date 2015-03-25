class Reminder < ApplicationMailer

	def medicine(medicine)
		@medicine = medicine
		mail(to: medicine.user.email, subject: 'Medication Reminder')
	end

	def test
		mail(to: User.first.email, subject: 'Medication Reminder')
	end

	def email(user)
    	@user = user
    	#@url  = 'http://example.com/login'
    	#email_with_name = %("#@user.First_name}")
    	mail(to: @user.email, subject: 'Medication Reminder')		
	end
end
