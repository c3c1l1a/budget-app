require 'rails_helper'

RSpec.describe User, type: :model do
  # test validations.
  describe 'model validations' do
    it 'is not valid without a name' do
      expect(User.new).to_not be_valid
    end
  end
end
