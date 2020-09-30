class AddNumberOfTreatsToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :number_of_treats, :integer
  end
end
