require 'rails_helper'

RSpec.describe User, type: :model do
  
  before do
    @user =   User.create(:user_name => "jackcooper1245", :first_name => "Jack", :last_name => "Cooper", :email => "jackcooper1245@gmail.com", :password => "password", :age => "25")
    @budget = Budget.create(:name => "Monthly Budget", :total => 100, :user => @user, :currency => "£")
    @list_1 = List.create(:name => "Weekend fun", :week => "1st week of August", :user => @user)
    @list_2 = List.create(:name => "Week not-fun", :week => "2nd week of August", :user => @user)
    @treat_1 = Treat.create(:name => "Beer", :cost => 3, :user => @user, :list => @list_1)
    @treat_2 = Treat.create(:name => "Curry", :cost => 12, :user => @user, :list => @list_2)
  end

  it "is valid with a user_name, first_name, last_name, email, password, and age" do
    expect(@user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(user_name: "Name")).not_to be_valid
  end

  it "has many lists" do
    expect(@user.lists.first).to eq(@list_1)
    expect(@user.lists.last).to eq(@list_2)
  end

  it "has mant budget" do
    expect(@user.budgets.first).to eq(@budget)
  end

  it "has many treats through lists" do
    expect(@user.treats.first).to eq(@treat_1)
    expect(@user.treats.last).to eq(@treat_2)
  end

end
