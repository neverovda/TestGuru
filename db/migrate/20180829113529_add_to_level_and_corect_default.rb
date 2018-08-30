class AddToLevelAndCorectDefault < ActiveRecord::Migration[5.2]
  def up
    change_column_default(:answers, :correct, false)
    change_column_default(:tests, :level, 1)
  end
  def down
    change_column_default(:answers, :correct, nil)
    change_column_default(:tests, :level, nil)
  end
end
