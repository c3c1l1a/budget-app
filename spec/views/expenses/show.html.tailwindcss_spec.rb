require 'rails_helper'

RSpec.describe 'expenses/show', type: :view do
  let(:user) do
    create(:user)
  end

  before(:each) do
    assign(:expense, Expense.create!(
                       name: 'Name',
                       description: 'Description',
                       icon: 'Icon',
                       user:
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
