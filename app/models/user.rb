class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true
  validates :password, presence: true, length: { in: 6..25 }
  validates :email, presence:true
end
