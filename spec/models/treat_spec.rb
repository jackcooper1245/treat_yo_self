require 'rails_helper'

RSpec.describe Treat, type: :model do


  before do
    @user =   User.create(:user_name => "jackcooper1245", :first_name => "Jack", :last_name => "Cooper", :email => "jackcooper1245@gmail.com", :password => "password", :age => "25")
    @list = List.create(:name => "Weekend fun", :week => "1st week of August")
    @treat = Treat.create(:name => "Curry", :cost => 12, :user => @user, :list => @list)
  end

    it "is valid with a name & cost" do
      expect(@treat).to be_valid
    end

    it "should belong to a User" do
      t = Treat.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should belong to a List" do
      t = Treat.reflect_on_association(:list)
      expect(t.macro).to eq(:belongs_to)
    end
  
end
