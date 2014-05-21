namespace :notifications do
  desc "Sends notifications"
  task :send => :environment do
    User.all.each do |u|
      UserMailer.reminder_email(u).deliver
    end
  end
end