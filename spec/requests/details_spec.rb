require 'rails_helper'
require_relative '../support/devise'

RSpec.describe '/expenses/1/details', type: :request do
  let(:user) do
    create(:user)
  end

  let(:expense) do 
    create(:expense, user_id: user.id)
  end

  let(:valid_attributes) do
    {
      'name' => 'Transaction 1',
      'amount' => '200'
    }
  end

  before(:each) do
    sign_in user
    get root_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get expense_details_url(expense)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_expense_detail_url(expense)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      valid_attributes['expense_id'] = expense.id
      detail = Detail.create! valid_attributes
      get expense_detail_url(expense, detail)
      
      expect(response).to be_successful
    end
  end

end
