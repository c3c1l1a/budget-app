require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) do
    create(:user)
  end
  subject do
    Expense.new(
      user:,
      name: 'Mc Donalds',
      description: 'Lots of cash spent here',
      icon: 'icon url'
    )
  end
  before { subject.save }

  describe 'associations' do
    it 'has many details' do
      assc = described_class.reflect_on_association(:details)
      expect(assc.macro).to eq :has_many
    end
  end

  # test validations.
  describe 'model validations' do
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
  end
end
