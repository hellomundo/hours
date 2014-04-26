class Client < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 1}
  
  has_many :projects
  
  scope :active, -> { where(is_active: true) }
  scope :inactive, -> { where(is_active: false) }
  
  def deactivate 
    self.is_active = false;
    
    projects.update_all(is_active: false)
  end
  
  def activate
    is_active = true;
  end
end
