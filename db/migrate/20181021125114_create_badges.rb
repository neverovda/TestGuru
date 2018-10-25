class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :description
      t.integer :level
      t.boolean :one_successful_attempt, default: false
      t.references :category
      t.references :author, foreign_key: { to_table: :users }
      
      t.timestamps
    end
  end
end
