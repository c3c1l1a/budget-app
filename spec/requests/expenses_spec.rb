require 'rails_helper'
require_relative '../support/devise'

RSpec.describe "/expenses", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Expense. As you add validations to Expense, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  describe "GET /index" do
    it "renders a successful response" do
      user = create(:user)
      sign_in user
      get root_path

      get expenses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      expense = Expense.create! valid_attributes
      get expense_url(expense)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_expense_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
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
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested expense" do
        expense = Expense.create! valid_attributes
        patch expense_url(expense), params: { expense: new_attributes }
        expense.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the expense" do
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
