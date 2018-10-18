class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
