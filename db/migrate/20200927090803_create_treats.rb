class CreateTreats < ActiveRecord::Migration[6.0]
  def change
    create_table :treats do |t|
      t.string :name
      t.integer :cost
      t.integer :user_id
      t.integer :list_id
      t.timestamps
    end
  end
end
