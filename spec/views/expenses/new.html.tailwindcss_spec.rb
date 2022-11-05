require 'rails_helper'

RSpec.describe 'expenses/new', type: :view do
  let(:user) do
    create(:user)
  end

  before(:each) do
    assign(:expense, Expense.new(
                       name: 'MyString',
                       description: 'MyString',
                       icon: 'MyString',
                       user:
                     ))
  end

  it 'renders new expense form' do
    render

    assert_select 'form[action=?][method=?]', expenses_path, 'post' do
      assert_select 'input[name=?]', 'expense[name]'

      assert_select 'input[name=?]', 'expense[description]'

      assert_select 'input[name=?]', 'expense[icon]'
    end
  end
end
