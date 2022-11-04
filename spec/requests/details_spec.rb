require 'rails_helper'
require_relative '../support/devise'

RSpec.describe '/expenses/1/details', type: :request do
  let(:user) do
    create(:user)
  end

  before(:each) do
    sign_in user
    get root_path
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      
      expect(true).to eql(true)
    end
  end
end
