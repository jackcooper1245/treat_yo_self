class AddStartTimeAndEndTimeToList < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :start_time, :datetime
    add_column :lists, :end_time, :datetime
  end
end
