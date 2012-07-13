require 'spec_helper'

describe "UserPages" do
  
  describe "signup" do

    before { visit root_path  }

    let(:submit) { "Registrarme" }

    describe "con informaci�n inv�lida" do
      it "no deber�a crear usuario" do
        expect { click_button "Registrarme" }.not_to change(User, :count)
      end
    end

    describe "con informaci�n v�lida" do
      before do
        fill_in "signupfirstname",  :with => "Example User"
        fill_in "signupemail",      :with => "user@example.com"
        fill_in "signuppassword",   :with => "foobar"
      end

      it "deber�a crear un usuario" do
        expect { click_button "Registrarme" }.to change(User, :count).by(1)
      end
    end
  end
end
