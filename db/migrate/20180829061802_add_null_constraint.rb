class AddNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)
    
    change_column_null(:categories, :title, false)
    
    change_column_null(:questions, :body, false)
    change_column_null(:questions, :test_id, false)

    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :id_category, false)

    change_column_null(:users, :name, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end