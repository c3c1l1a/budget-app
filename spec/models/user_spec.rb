require 'rails_helper'

RSpec.describe User, type: :model do
  # test associtions
  describe 'associations' do
    it 'has many expenses' do
      assc = described_class.reflect_on_association(:expenses)
      expect(assc.macro).to eq :has_many
    end
  end

  # test validations.
  describe 'model validations' do
    it 'is not valid without a name' do
      expect(User.new).to_not be_valid
    end

    it 'is valid with valid values' do
      expect(User.new({
        name:'Jane', 
        email:'jane_doe@email.com',
        password: 'password'
      })).to be_valid
    end
  end
end
