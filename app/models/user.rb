# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  firstname       :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  lastname        :string(255)
#  date_of_birth   :date
#  nickname        :string(255)
#  gender          :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :firstname,:presence => true, :length => { :maximum => 100 }
  
  has_secure_password
  
  validates :password, :length => {:minimum => 6,:message => "debe tener como mínimo 6 caracteres"}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => { :with => VALID_EMAIL_REGEX },:uniqueness => { :case_sensitive => false }
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.hex
    end
end
