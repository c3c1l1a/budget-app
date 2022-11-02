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

  it 'name should not be blank' do 
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'name should be between 3 - 10 characters' do 
    subject.name = 'na'
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid 
  end 

  it 'icon should not be blank' do 
    subject.icon = ''
    expect(subject).to_not be_valid
  end

  it 'icon should longer than 3 characters' do 
    subject.icon = 'ic'
    expect(subject).to_not be_valid
  end 

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid 
  end

  it 'description should not be blank' do 
    subject.description = ''
    expect(subject).to_not be_valid
  end 

  it 'description should longer than 3 characters' do 
    subject.description = 'de'
    expect(subject).to_not be_valid
  end 

  it 'amount should not be less than 0' do 
    subject.amount = -5
    expect(subject).to_not be_valid
  end

  it 'amount should not be nil' 
end

