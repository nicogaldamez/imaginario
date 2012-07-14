require 'spec_helper'

describe "Authentication" do
  subject { page }
  
  describe "signin" do
  	
    before { visit root_path }
    
    let(:submit) { "Iniciar sesión" }
    
    describe "con información no valida" do
      before { click_button submit }

      it { should have_selector('div.alert.alert-error') }
      
      describe "después de visitar otra página" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    describe "con información válida" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "session_email",    :with => user.email
        fill_in "session_password", :with => user.password
        click_button submit
      end

      it { should have_link('Profile', :href => user_path(user)) }
      it { should have_link('Sign out', :href => signout_path) }
      it { should_not have_link('Sign in', :href => signin_path) }
    end
  end
end