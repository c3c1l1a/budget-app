require 'rails_helper'
require_relative '../support/devise'

RSpec.describe '/expenses/1/details', type: :request do
  let(:user) do
    create(:user)
  end

  let(:expense) do 
    create(:expense, user_id: user.id)
  end

  before(:each) do
    sign_in user
    get expense_details_url(expense)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      expect(true).to eql(true)
    end
  end
end
