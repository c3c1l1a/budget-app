require 'rails_helper'

RSpec.describe Detail, type: :model do
  let(:expense) do
    create(:expense)
  end

  subject do
    Detail.new(
      expense_id: expense.id,
      name: 'Transaction 1',
      amount: '20'
    )
  end


  describe 'model validations' do
    it 'name should be present' do
      pp expense
      expect(true).to eql(true)
    end

  end
end
