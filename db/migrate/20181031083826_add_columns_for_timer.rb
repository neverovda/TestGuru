class AddColumnsForTimer < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time, :integer, null: false, default: 0
    add_column :test_passages, :end_time, :datetime  
  end
end
