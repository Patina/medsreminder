class ApplicationMailer < ActionMailer::Base
  default from: "jane@nycda.com"
  layout 'mailer'
end
