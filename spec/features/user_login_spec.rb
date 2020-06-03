require 'rails_helper'

RSpec.feature "UserLogsIn", type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(
      first_name: "Hello",
      last_name: "World",
      email: "test@mail.com",
      password: "test",
      password_confirmation: "test"
    )

    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name:  Faker::Hipster.sentence(word_count: 3),
      description: Faker::Hipster.paragraph(sentence_count: 4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end

  scenario "They login and see their email username in nav bar" do
    # ACT
    visit '/login'
    puts page.html
    within 'form' do
      fill_in id: "email", with: "test@mail.com"
      fill_in id: "password", with: "test"

      click_button "Submit"
    end
    # DEBUG
    save_screenshot('user-login.png')

    # VERIFY
    expect(page).to have_css 'article.product'
    expect(page).to have_text "Signed in as test@mail.com"
  end

end