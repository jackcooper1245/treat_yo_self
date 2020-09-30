require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  before do
    User.destroy_all
  end

  let(:user) {User.create(:user_name => "jackcooper1245", :first_name => "Jack", :last_name => "Cooper", :email => "jackcooper1245@gmail.com", :password => "password", :age => "25")
}

  describe 'post create' do
    it 'logs you in with the correct password' do
      post :create, params: { user: {user_name: user.user_name, password: user.password} }
      expect(session[:user_id]).to eq(user.id)
    end

    it 'rejects invalid passwords' do
      post :create, params: { user: {user_name: user.user_name, password: user.password = 'x'}  }
      expect(session[:user_id]).to be_nil
    end

    it 'rejects empty passwords' do
      post :create, params: { user: {user_name: user.user_name, password: ''} }
      expect(session[:user_id]).to be_nil
    end
  end
end