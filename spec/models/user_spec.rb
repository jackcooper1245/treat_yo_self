require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user) {
    User.create(
      :user_name => "jackcooper1245",
      :first_name => "Jack",
      :last_name => "Cooper",
      :email => "jackcooper1245@gmail.com",
      :password => "password",
      :age => "25"
    )
  }

  it "is valid with a user_name, first_name, last_name, email, password, and age" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(user_name: "Name")).not_to be_valid
  end

  it "has many lists" do
    first_list = List.create(:user_id => user.id)
    second_list = List.create(:user_id => user.id)
    expect(user.lists.first).to eq(first_list)
    expect(user.lists.last).to eq(second_list)
  end

  it "has many budgets" do
    first_budget = Budget.create(:user_id => user.id)
    second_budget = Budget.create(:user_id => user.id)
    expect(user.budgets.first).to eq(budget_list)
    expect(user.budgets.last).to eq(budget_list)
  end

  it "has many treats through lists" do
    user.treats << [order_pizza, buy_clothes]
    expect(user.treats.first).to eq(order_pizza)
    expect(user.treats.last).to eq(buy_clothes)
  end

end
