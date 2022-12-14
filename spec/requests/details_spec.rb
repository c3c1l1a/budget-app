require 'rails_helper'
require_relative '../support/devise'

RSpec.describe '/details', type: :request do
  let(:user) do
    create(:user)
  end

  let(:expense) do
    create(:expense, user_id: user.id)
  end

  let(:valid_attributes) do
    {
      'name' => 'Transaction 1',
      'amount' => '200',
      'expense_id' => expense.id
    }
  end

  let(:invalid_attributes) do
    {
      'name' => '',
      'amount' => '-2',
      'expense_id' => expense.id
    }
  end

  before(:each) do
    sign_in user
    get root_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get details_url(expense)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get details_url
      expect(response).to be_successful
    end
  end

  # describe 'GET /show' do
  #   it 'renders a successful response' do
  #     detail = Detail.create! valid_attributes
  #     get detail_url(detail)

  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /edit' do
  #   it 'renders a successful response' do
  #     detail = Detail.create! valid_attributes
  #     get edit_expense_detail_url(expense, detail)

  #     expect(response).to be_successful
  #   end
  # end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Detail' do
        expect do
          post details_url, params: { detail: valid_attributes }
        end.to change(Detail, :count).by(1)
      end

      it 'redirects to the created Detail' do
        post details_url, params: { detail: valid_attributes }
        expect(response).to redirect_to(expense_url(Detail.last.expense))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Expense' do
        expect do
          post details_url, params: { detail: invalid_attributes }
        end.to change(Detail, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post details_url, params: { detail: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
