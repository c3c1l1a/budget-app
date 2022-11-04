require 'rails_helper'

RSpec.describe 'expenses/index', type: :view do
  let(:user) do
    create(:user)
  end

  
  before(:each) do
    assign(:expenses, [
      create(:expense, user_id: user.id)
    ])
  end

  it 'renders a list of expenses' do
    render
    expect(rendered).to match(/Mc Donalds/)
  end
end
