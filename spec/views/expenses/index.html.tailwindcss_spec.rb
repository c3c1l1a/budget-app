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
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Description'.to_s), count: 1
    assert_select cell_selector, text: Regexp.new('Icon'.to_s), count: 1
    #assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
