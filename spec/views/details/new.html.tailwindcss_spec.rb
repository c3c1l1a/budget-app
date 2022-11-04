require 'rails_helper'

RSpec.describe 'details/new', type: :view do
  let(:user) do
    create(:user)
  end

  let(:expense) do 
    create(:expense, user_id: user.id)
  end

  before(:each) do
    @detail = create(:detail, expense_id: expense.id)
  end

  it 'renders new details form' do
    render

    assert_select 'form[action=?][method=?]', details_path, 'post' do
      assert_select 'input[name=?]', 'detail[name]'
      assert_select 'input[name=?]', 'detail[amount]'
    end
  end
end
