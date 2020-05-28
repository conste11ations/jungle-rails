class Category < ActiveRecord::Base

  has_many :products
  validates :name, presence: true
  validate :only_distinct_categories, on: :create

  def only_distinct_categories
    if Category.exists?(name: name)
      errors.add(:base, 'This category already exists')
    end
  end

end
