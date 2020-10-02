class AddStartTimeToTreats < ActiveRecord::Migration[6.0]
  def change
    add_column :treats, :start_time, :datetime
  end
end
