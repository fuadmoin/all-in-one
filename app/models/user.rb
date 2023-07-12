class User < ApplicationRecord
  has_many :categories, foreign_key: "user_id", dependent: :destroy
  has_many :items, foreign_key: "author_id", dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :fname, presence: true
  validates :mname, presence: true
  validates :lname, presence: true
end
