class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :gist_hash

      t.timestamps
    end
  end
end
