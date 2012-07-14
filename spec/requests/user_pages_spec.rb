require 'spec_helper'

describe "UserPages" do
  subject { page }
  
  describe "signup" do

    before { visit root_path  }

    let(:submit) { "Registrarme" }

    describe "con información inválida" do
      it "no debería crear usuario" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "después de enviar el formulario" do
        before { click_button submit }
        
         it { should have_content('El nombre no puede estar en blanco') } 
         it { should have_content('La clave no puede estar en blanco') } 
         it { should have_content('La clave debe tener como mínimo 6 caracteres') } 
         it { should have_content('El correo no es válido') } 
      end

    end

    describe "con información válida" do
      before do
        fill_in "user_firstname",  :with => "Example User"
        fill_in "user_email",      :with => "user@example.com"
        fill_in "user_password",   :with => "foobar"
      end

      it "debería crear un usuario" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "después de crear el usuario" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_selector('div.alert.alert-success', :text => 'Bienvenido') }
        it { should have_link('Sign out') }
      end
    end
  end
end
