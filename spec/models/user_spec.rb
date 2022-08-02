require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Validations' do

  it "is invalid when password and password_confirmation fields don't match" do
    @user = User.new(:first_name => "Tifa", :last_name => "Lockhart", :email => "email@email.com", :password => "password1", :password_confirmation => "notpassword")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
  end

  it "is invalid when the email is not unique" do
    User.create!(:first_name => "Tifa", :last_name => "Lockhart", :email => "email@email.com", :password => "password1", :password_confirmation => "password1")
    @user = User.new(:first_name => "Cloud", :last_name => "Strife",:email => "email@email.com", :password => "password1", :password_confirmation => "password1")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Email has already been taken")
  end

  it "is invalid when first name is not provided" do
    @user = User.new(:first_name => nil, :last_name => "Lockhart", :email => "email@email.com", :password => "password1", :password_confirmation => "password1")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
  end
  
  it "is invalid when the password is under 8 characters" do
    @user = User.new(:first_name => "Tifa", :last_name => "Lockhart", :email => "email@email.com", :password => "pass", :password_confirmation => "pass")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)")
  end


  end
end
