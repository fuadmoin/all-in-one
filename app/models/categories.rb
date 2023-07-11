class Category < ApplicationRecord
    has_and_belogs_to_many :items
    validates :name, presence: true, uniqueness: true
    validates :icon, presence: true
end