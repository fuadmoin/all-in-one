class Category < ApplicationRecord
    has_and_belongs_to_many :items
    belongs_to :user, claa_name: "User", foreign_key: "user_id"
    validates :name, presence: true, uniqueness: true
    validates :icon, presence: true
end