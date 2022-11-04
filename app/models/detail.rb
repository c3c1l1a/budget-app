class Detail < ApplicationRecord
  belongs_to :expense

  validates :name, presence: { message: "Name can't be null" }, length: { minimum: 3  }
  validates :amount, presence: { message: "Amount can't be null" }
  validates :amount, numericality: { only_float: true, greater_than: 0, message: 'Amount must be greater than 0' }
end
