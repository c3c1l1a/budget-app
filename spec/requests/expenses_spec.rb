require 'rails_helper'
require_relative '../support/devise'

RSpec.describe "/expenses", type: :request do

  let(:user) {
    user = create(:user)
  }

  before(:each ) {
    sign_in user
    get root_path
  }

  let(:valid_attributes) {
    {
        "name"=>"Mc Donalds", 
        "description"=>"Expenses in Mc Donalds", 
        "icon"=>"icon", 
        "amount"=>"200"
    }
  }

  let(:invalid_attributes) {
    {
        "name"=>"", 
        "description"=>"", 
        "icon"=>"", 
        "amount"=>"-2"
    }
  }


  describe "GET /index" do
    it "renders a successful response" do
      get expenses_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_expense_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      valid_attributes['user_id'] = user.id
      expense = Expense.create! valid_attributes
      
      get expense_url(expense)
      expect(response).to be_successful
    end
  end

  
  describe "GET /edit" do
    it "renders a successful response" do
      valid_attributes['user_id'] = user.id
      expense = Expense.create! valid_attributes
      get edit_expense_url(expense)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Expense" do
        expect {
          post expenses_url, params: { expense: valid_attributes }
        }.to change(Expense, :count).by(1)
      end

      it "redirects to the created expense" do
        post expenses_url, params: { expense: valid_attributes }
        expect(response).to redirect_to(expense_url(Expense.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Expense" do
        expect {
          post expenses_url, params: { expense: invalid_attributes }
        }.to change(Expense, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post expenses_url, params: { expense: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
            "name"=>"Mc Donalds", 
            "description"=>"Expenses in Mc Donalds", 
            "icon"=>"icon", 
            "amount"=>"230"
        }
      }

      it "updates the requested expense" do
        valid_attributes['user_id'] = user.id
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: new_attributes }
        expense.reload
        expect(Expense.last.amount).to eql(230.0)
      end

      it "redirects to the expense" do
        valid_attributes['user_id'] = user.id
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: new_attributes }
        expense.reload
        expect(response).to redirect_to(expense_url(expense))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested expense" do
      expense = Expense.create! valid_attributes
      expect {
        delete expense_url(expense)
      }.to change(Expense, :count).by(-1)
    end

    it "redirects to the expenses list" do
      expense = Expense.create! valid_attributes
      delete expense_url(expense)
      expect(response).to redirect_to(expenses_url)
    end
  end
end
