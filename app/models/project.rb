class Project < ActiveRecord::Base
  belongs_to :client
  
  has_many :efforts
  has_many :users, through: :efforts

  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
  
  def full_name
    self.client.name + " " + self.name
  end
  

end
