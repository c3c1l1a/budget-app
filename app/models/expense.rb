class Expense < ApplicationRecord
  belongs_to :user

  validates :name, presence: { message: "Name can't be null" }, length: { in: 3..10 }
  validates :icon, presence: { message: "Icon can't be null" }, length: { minimum: 3 }
  validates :desciption, presence: { message: "Description can't be null"}, length: {minimum: 3}
  validates :amount, presence: { message: "Amount can't be null" }
  validates :amount, numericality: { only_integer: true, greater_than: 0, message: 'Amount must be greater than 0' }
end
