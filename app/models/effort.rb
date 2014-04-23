class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  def hours
    self.duration.nil? ? nil : self.duration / 60
  end
  
  def hours=(hours)
    self.duration = hours.to_i * 60
  end

end
