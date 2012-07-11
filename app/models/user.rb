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
  
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  validates :firstname, :presence => true, :length => { :maximum => 100 }
  
  validates :password, :presence => true, :length => {:minimum => 6}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX },:uniqueness => { :case_sensitive => false }
end
