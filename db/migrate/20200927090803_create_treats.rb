class CreateTreats < ActiveRecord::Migration[6.0]
  def change
    create_table :treats do |t|

      t.timestamps
    end
  end
end
