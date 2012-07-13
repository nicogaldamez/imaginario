require 'spec_helper'

describe "UserPages" do
  
  describe "signup" do

    before { visit root_path  }

    let(:submit) { "Registrarme" }

    describe "con información inválida" do
      it "no debería crear usuario" do
        expect { click_button "Registrarme" }.not_to change(User, :count)
      end
    end

    describe "con información válida" do
      before do
        fill_in "signupfirstname",  :with => "Example User"
        fill_in "signupemail",      :with => "user@example.com"
        fill_in "signuppassword",   :with => "foobar"
      end

      it "debería crear un usuario" do
        expect { click_button "Registrarme" }.to change(User, :count).by(1)
      end
    end
  end
end
