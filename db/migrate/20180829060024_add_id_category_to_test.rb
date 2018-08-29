class AddIdCategoryToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :id_category, :integer
  end
end
