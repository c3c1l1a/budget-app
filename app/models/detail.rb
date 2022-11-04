class Detail < ApplicationRecord
  belongs_to :expense

  validates :name, presence: { message: "Name can't be null" }, length: { minimum: 3  }
end
