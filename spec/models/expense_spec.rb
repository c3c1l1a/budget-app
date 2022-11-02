require 'rails_helper'

RSpec.describe Expense, type: :model do
  @user = User.new(name: 'Cecilia', email: 'test@gmail.com', password: '123456')
  subject { Expense.new(
    user: @user, 
    name: 'Hello', 
    description: 'Inventory Desc',
    icon: 'icon url', 
    amount: '20') }
  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be blank'
  it 'name should be between 3 - 10 characters'
  it 'icon should be present'
  it 'icon should not be blank'
  it 'icon should longer than 3 characters'
  it 'description should be present'
  it 'description should not be blank'
  it 'description should longer than 3 characters'
  it 'amount should not be less than 0'
  it 'amount should not be nil' 
end

