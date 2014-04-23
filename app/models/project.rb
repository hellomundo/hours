class Project < ActiveRecord::Base
  belongs_to :client
  
  has_many :efforts
  has_many :users, through: :efforts
  
  def full_name
    self.client.name + " " + self.name
  end
end
