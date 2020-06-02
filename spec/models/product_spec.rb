require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    subject {
      Product.new(
        name: "Anything",
        price: 10000,
        quantity: 5,
        category: Category.new({ name:"test" })
      )
    }

    it "has been instantiated" do
      expect(subject).to be_a(Product)
    end

    it "has valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid if it has a blank name" do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid if it has a blank price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid if it has a blank quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid if it has a blank category" do
      subject.category = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end
  end
end
