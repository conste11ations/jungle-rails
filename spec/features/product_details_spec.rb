require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(word_count: 3),
          description: Faker::Hipster.paragraph(sentence_count: 4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  
    scenario "They see details of a product" do
      # ACT
      visit root_path
  
      first('article.product').find_link('Details').click
  
    # DEBUG
    save_screenshot('product-details-screenshot.png')

    #VERIFY      
    expect(page).to have_css 'section.products-show', count: 1

    end
end
