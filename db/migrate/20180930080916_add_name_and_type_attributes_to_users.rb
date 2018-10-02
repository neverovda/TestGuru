class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]
  
  # def change
  #   add_column :users, :type, :string, null: false, default: 'User'
  #   add_column :users, :first_name, :string
  #   add_column :users, :last_name, :string
  #   add_index :users, :type
  #   remove_column :users, :name, :string
  # end

  def change
    change_table :users do |t|
      t.string :type, null: false, default: 'User'
      t.index :type
      t.string :first_name
      t.string :last_name
      t.remove :name, :string
    end  
  end

end
