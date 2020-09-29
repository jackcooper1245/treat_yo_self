require 'rails_helper'

RSpec.describe Budget, type: :model do
  before do
    @user =   User.create(:user_name => "jackcooper1245", :first_name => "Jack", :last_name => "Cooper", :email => "jackcooper1245@gmail.com", :password => "password", :age => "25")
    @list_1 = List.create(:name => "Weekend fun", :week => "1st week of August", :user => @user)
    @list_2 = List.create(:name => "Week not-fun", :week => "2nd week of August", :user => @user)
    @treat_1 = Treat.create(:name => "Beer", :cost => 3, :user => @user, :list => @list_1)
    @treat_2 = Treat.create(:name => "Curry", :cost => 12, :user => @user, :list => @list_2)
    @budget = Budget.create(:name => "Weekly Budget", :total => 50, :user => @user, :currency => "£")
  end

  it "should be valid with a name, a total and a currency" do
    expect(@budget).to be_valid
  end

  it "should belong to a user" do
    t = Budget.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should have many lists, through a user" do
    expect(@budget.lists.first).to eq(@list_1)
    expect(@budget.lists.last).to eq(@list_2)
  end

  it "should have many treats, through many lists" do
    expect(@budget.treats.first).to eq(@treat_1)
    expect(@budget.treats.last).to eq(@treat_2)
  end
end
