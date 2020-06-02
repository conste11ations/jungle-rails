require 'rails_helper'

  RSpec.describe User, type: :model do
    describe 'Validations' do
      subject {
        described_class.new(
          first_name: "hello",
          last_name: "world",
          email: "test@mail.com",
          password: "test",
          password_confirmation: "test"
        )}
      it "is valid with valid attributes" do
        subject.save
        is_expected.to be_valid
      end
  
      it "is not valid without a first name" do
        subject.first_name = nil
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("First name can't be blank")
      end
  
      it "is not valid without a last name" do
        subject.last_name = nil
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Last name can't be blank")
      end
  
      it "is not valid without an email" do
        subject.email = nil
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Email can't be blank")
      end
  
      it "is not valid without a password" do
        subject.password = nil
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Password can't be blank")
      end
  
      it "is not valid without matching password and password confirmation" do
        subject.password = "that"
        subject.password_confirmation = "test"
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  
      it "is not valid without a 2 character password" do
        subject.password = "a"
        subject.password_confirmation = "a"
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Password is too short (minimum is 2 characters)")
      end
  
      it "is not valid with a duplicate email" do
        user = User.new(
          first_name: "Hello",
          last_name: "Again",
          email: "TEST@mail.com",
          password: "test",
          password_confirmation: "test"
        )
  
        user.save
  
        expect(subject).to_not be_valid
        expect(subject.errors.full_messages).to include("Email has already been taken")
      end
    end
  
    describe '.authenticate_with_credentials' do
      subject {
        described_class.new(
          first_name: "First",
          last_name: "Last",
          email: "email@test.com",
          password: "test",
          password_confirmation: "test"
        )}
      it "is valid with existing email and matching password" do
        subject.save
  
        expect(User.authenticate_with_credentials("email@test.com", "test")).to be_valid
      end
  
      it "is not valide with incorrect password" do
        subject.save
  
        login = User.authenticate_with_credentials("email@test.com", "text")
  
        expect(login).to be_nil
      end
  
      it "is valid with an email with extra space" do
        subject.save
  
        expect(User.authenticate_with_credentials(" email@test.com ", "test")).to be_valid
      end
  
      it "is valid with an email not matching case" do
        subject.save
  
        expect(User.authenticate_with_credentials("eMaIl@tEst.cOm", "test")).to be_valid
      end
    end
  end