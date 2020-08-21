class User < ApplicationRecord
  has_many :user_questions
  validates :name, presence: true, length: { in: 3..50 }
  validates :regno, presence: true, uniqueness: true
end
