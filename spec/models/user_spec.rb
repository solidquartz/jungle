require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Validations' do

  it "is invalid when password and password_confirmation fields don't match" do
    @user = User.new(:first_name => "Tifa", :last_name => "Lockhart", :email => "email@email.com", :password => "password", :password_confirmation => "notpassword")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
  end

  it "is invalid when the email is not unique" do
    User.create!(:email => "email@email.com", :password => "password", :password_confirmation => "password")
    @user = User.new(:email => "email@email.com", :password => "password", :password_confirmation => "password")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Email has already been taken")
  end

  # it "must have a first name, last name, and email" do

  # end


  end
end
