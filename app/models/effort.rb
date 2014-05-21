class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  def hours
    self.duration.nil? ? nil : self.duration / 60
  end
  
  def hours=(hours)
    self.duration = hours.to_i * 60
  end

  def self.by_user_since(user_id, since_date)
    Effort.where("user_id = :id AND performed_on >= :day", {id: user_id, day: since_date}) 
  end
  
  def self.this_week_by_user(user_id)
    self.by_user_since(user_id, Time.now.beginning_of_week)
  end
  
  def self.this_month_by_user(user_id)
    self.by_user_since(user_id, Time.now.beginning_of_month)
  end
  
  def self.this_year_by_user(user_id)
    self.by_user_since(user_id, Time.now.beginning_of_year)
  end
  
end
