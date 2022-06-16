class RemoveOption4FromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :option_4, :string
  end
end
