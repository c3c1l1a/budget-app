require 'rails_helper'

RSpec.describe 'expenses/edit', type: :view do
  let(:user) do
    create(:user)
  end

  let(:expense) do
    Expense.create!(
      name: 'MyString',
      description: 'MyString',
      icon: 'MyString',
      amount: 1,
      user: user
    )
  end

  before(:each) do
    assign(:expense, expense)
  end

  it 'renders the edit expense form' do
    render

    assert_select 'form[action=?][method=?]', expense_path(expense), 'post' do
      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[description]'

      assert_select 'input[name=?]', 'expense[icon]'

      assert_select 'input[name=?]', 'expense[amount]'
    end
  end
end
