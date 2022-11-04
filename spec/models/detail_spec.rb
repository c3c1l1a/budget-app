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
      subject.name = nil
      expect(subject).to_not be_valid
    end 

    it 'name should not be blank' do 
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'name should be > 3 characters' do 
      subject.name = 'na'
      expect(subject).to_not be_valid
    end 
    
    it 'amount should be present'
    it 'amount should not be blank'
    it 'amount should be >= 0'
  end
end
