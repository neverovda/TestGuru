class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false
      t.references :test, null: false

      t.timestamps
    end
  end
end
