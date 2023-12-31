class Item < ApplicationRecord
  has_and_belongs_to_many :categories
  validates :name, presence: true
  validates :unit_price, numericality: { greater_than: 0 }
  validates :amount, numericality: { greater_than: 0 }
  validate :must_have_at_least_one_category

  private

  def must_have_at_least_one_category
    return unless categories.empty?

    errors.add(:categories, 'must have at least one category')
  end
end
