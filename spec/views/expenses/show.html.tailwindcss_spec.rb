require 'rails_helper'

RSpec.describe "expenses/show", type: :view do
  before(:each) do
    assign(:expense, Expense.create!(
      name: "Name",
      description: "Description",
      icon: "Icon",
      amount: 2,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Icon/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
