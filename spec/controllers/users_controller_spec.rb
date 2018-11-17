require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new users template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe 'POST #create' do
    context 'with valid params' do
      it 'logs in the user' do
        post :create, params: { user: { username: 'harry_potter', password: 'abcdef' } }
        
        user = User.find_by(username: 'harry_potter')
        expect(session[:session_token]).to eq(user.session_token)
      end
    end
    
    context 'with invalid params' do
      it 'validates the presence of password and renders the new template with errors' do
        post :create, params: { user: { username: 'harry_potter', password: '' } }
        expect(response).to render_template(:new)
        expect(flash[:errors]).to be_present
      end
    end
  end
end
