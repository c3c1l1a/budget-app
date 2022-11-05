class Expense < ApplicationRecord
  has_many :details
  belongs_to :user

  validates :name, presence: { message: "Name can't be null" }, length: { in: 3..10 }
  validates :icon, presence: { message: "Icon can't be null" }, length: { minimum: 3 }
  validates :description, presence: { message: "Description can't be null" }, length: { minimum: 3 }
end
