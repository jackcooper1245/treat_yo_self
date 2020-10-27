class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :total, default: 0
      t.string :currency, default: "£"
      t.integer :user_id
      t.timestamps
    end
  end
end
