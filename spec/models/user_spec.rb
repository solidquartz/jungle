require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Validations' do

  it "is invalid when password and password_confirmation fields don't match" do
    @user = User.new(
      :first_name => "Tifa", 
      :last_name => "Lockhart", 
      :email => "email@email.com", 
      :password => "password1", 
      :password_confirmation => "notpassword")

      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Password confirmation doesn't match Password")
  end

  it "is invalid when the email is not unique" do
    @user = User.new(
      :first_name => "Tifa", 
      :last_name => "Lockhart", 
      :email => "email@email.com", 
      :password => "password1", 
      :password_confirmation => "password1")
      @user.save

      @user2 = User.new(
        :first_name => "Cloud", 
        :last_name => "Strife", 
        :email => "email@email.com", 
        :password => "password1", 
        :password_confirmation => "password1")
        @user2.save
        expect(@user2).not_to be_valid
        expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")
  end

  it "is invalid when first name is not provided" do
    @user = User.new(
      :first_name => nil, 
      :last_name => "Lockhart", 
      :email => "email@email.com", 
      :password => "password1", 
      :password_confirmation => "password1")

      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("First name can't be blank")
  end
  
  it "is invalid when the password is under 8 characters" do
    @user = User.new(
      :first_name => "Tifa", 
      :last_name => "Lockhart", 
      :email => "email@email.com", 
      :password => "pass", 
      :password_confirmation => "pass")

      @user.save
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 8 characters)")
  end
end


describe ".authenticate_with_credentials" do

it "returns an instance of the user upon successful authentication" do
  @user = User.new(
    :first_name => "Tifa", 
    :last_name => "Lockhart", 
    :email => "email@email.com", 
    :password => "password1", 
    :password_confirmation => "password1")

    @user.save
    expect(@user).not_to be(nil)
  end

it "returns nil upon unsuccessful authentication" do
  @user = User.new(
    :first_name => "Tifa", 
    :last_name => "Lockhart", 
    :email => "email@email.com", 
    :password => "password1", 
    :password_confirmation => "passwofsjgsjme")
  expect(User.authenticate_with_credentials('email@email.com', 'password1')).to eq(nil)
  end

  it "authenticates if there is whitespace in the email input" do
  @user = User.new(
    :first_name => "Tifa", 
    :last_name => "Lockhart", 
    :email => " email@email.com ", 
    :password => "password1", 
    :password_confirmation => "password1")

    @user.save
    expect(@user).not_to be(nil)
  end

  it "authenticates if the email input is in mixed case" do
  @user = User.new(
    :first_name => "Tifa", 
    :last_name => "Lockhart", 
    :email => "email@email.COM", 
    :password => "password1", 
    :password_confirmation => "password1")

    @user.save
    expect(@user).not_to be(nil)
  end

end
end
