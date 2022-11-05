class ChangeDataTypeForExpenseAmount < ActiveRecord::Migration[7.0]
  def change
    change_table :expenses do |t|
      t.change :amount, :float
    end

  end
end
