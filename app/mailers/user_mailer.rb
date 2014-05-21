class UserMailer < ActionMailer::Base
  default from: "clock@sequitur-sf.com"
  
  def reminder_email(user)
    @user = user;
    @url = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Clock those hours!')
  end
end
