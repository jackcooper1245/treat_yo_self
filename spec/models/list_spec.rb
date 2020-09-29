require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @user =   User.create(:user_name => "jackcooper1245", :first_name => "Jack", :last_name => "Cooper", :email => "jackcooper1245@gmail.com", :password => "password", :age => "25")
    @budget = Budget.create(:name => "Weekly Budget", :total => 50, :user => @user, :currency => "£")
    @list = List.create(:name => "Weekend fun", :week => "1st week of August", :user => @user)
  end

  it "is valid with a name & week" do
    expect(@list).to be_valid
  end

  it "should have many to a Treats" do
    t = List.reflect_on_association(:treats)
    expect(t.macro).to eq(:has_many)
  end

  it "should belong to a User" do
    t = List.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should have a budget, through a user" do
  expect(@list.budget).to eq(@budget)
  end
 
end
