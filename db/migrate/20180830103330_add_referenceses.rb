class AddReferenceses < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :category, foreign_key: true
    add_reference :questions, :test, foreign_key: true
    add_reference :answers, :questions, foreign_key: true
  end
end
