require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Validations' do

  it "is invalid when password and password_confirmation fields don't match" do
    @user = User.new(:first_name => "Tifa", :last_name => "Lockhart", :email => "email@email.com", :password => "password", :password_confirmation => "notpassword")
    expect(@user).to_not be_valid
  end

  it "must be a unique email" do

  end

  # it "must have a first name, last name, and email" do

  # end


  end
end
