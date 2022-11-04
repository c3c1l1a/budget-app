class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :name
      t.float :amount
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
