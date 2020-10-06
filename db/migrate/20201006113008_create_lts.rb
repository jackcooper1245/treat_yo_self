class CreateLts < ActiveRecord::Migration[6.0]
  def change
    create_table :lts do |t|
      t.datetime :start_time
      t.integer :treat_id
      t.integer :list_id
      t.timestamps
    end
  end
end
