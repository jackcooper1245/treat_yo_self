class AddTreatIdToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :treat_id, :integer
  end
end
