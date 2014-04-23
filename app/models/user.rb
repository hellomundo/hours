class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  
  has_many :efforts
  has_many :projects, through: :efforts
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :password, length: { minimum: 6 }, :if => :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def update_attributes_without_requiring_password(params)
    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
      update_attributes params
    end
  end
  
  private 
  
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
end
