class RemoveOption3FromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :option_3, :string
  end
end
