class RemoveAmountFromExpenses < ActiveRecord::Migration[7.0]
  def change
    remove_column :expenses, :amount, :float
  end
end
