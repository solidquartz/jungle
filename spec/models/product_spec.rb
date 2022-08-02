require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
  
    it "saves successfully with all valid fields provided" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Lilacs", :category => @category, :price_cents => 1000, :quantity => 3)
      expect(@product).to be_valid
    end

    it "does not save successfully when information is invalid" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => nil, :category => nil, :price_cents => nil, :quantity => nil)
      expect(@product).to_not be_valid
    end

    it "is invalid when a name isn't given" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => nil, :category => @category, :price_cents => 1000, :quantity => 3)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it "is invalid when a price isn't given" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Lilacs", :category => @category, :price_cents => nil, :quantity => 3)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it "is invalid when a quantity isn't given" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Lilacs", :category => @category, :price_cents => 1000, :quantity => nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it "is invalid when a category isn't given" do
      @category = Category.new(:name => "Bushes")
      @product = Product.new(:name => "Lilacs", :category => nil, :price_cents => 1000, :quantity => 3)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages[0]).to eq("Category must exist")
    end

  end
end