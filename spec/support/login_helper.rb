module LoginHelper
    
    def user_signup
        fill_in("user[user_name]", :with => "jacktestname")
        fill_in("user[first_name]", :with => "Jack")
        fill_in("user[last_name]", :with => "Cooper")
        fill_in("user[age]", :with => "25")
        fill_in("user[email]", :with => "15")
        fill_in("user[password]", :with => "password")
        fill_in("user[password_confirmation]", :with => "password")
        click_button('Create User')
      end
    
end