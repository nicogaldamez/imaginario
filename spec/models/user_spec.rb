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

require 'spec_helper'

describe User do
  
  before { @user = User.new(:firstname => "Nicolás", :email => "nicogaldamez@gmail.com",
  							:password => "foobar1") }
  
  subject { @user }
  
  it { should respond_to(:firstname) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }
  
  describe "con el firstname en blanco" do
    before { @user.firstname = " " }
    it { should_not be_valid }
  end  
  
  describe "con el mail en blanco" do
    before { @user.email = " " }
    it { should_not be_valid }
  end 
  
  describe "con el nombre muy largo" do
    before { @user.firstname = "a" * 101 }
    it { should_not be_valid }
  end
  
  describe "con el email invalido" do
    it "debe ser inválido" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end      
    end
  end

  describe "con el email válido" do
    it "debe ser válido" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end      
    end
  end
  
  describe "con el email repetido" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  
  describe "con la clave en blanco" do
  	before { @user.password = " " }
  	it { should_not be_valid }
  end
  
  describe "retorna valor del método authenticate" do
	before { @user.save }
	let(:found_user) { User.find_by_email(@user.email) }
	
	describe "con password válida" do
		it { should == found_user.authenticate(@user.password) }
	end
	
	describe "con password inválida" do
	let(:user_for_invalid_password) { found_user.authenticate("invalid") }
	
	it { should_not == user_for_invalid_password }
		specify { user_for_invalid_password.should be_false }
	end
  end
  
  describe "password muy corta" do
	  before { @user.password = @user.password_confirmation = "a" * 5 }
	  it { should be_invalid }
  end 
end
