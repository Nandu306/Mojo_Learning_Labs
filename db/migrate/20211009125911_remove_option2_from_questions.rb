class RemoveOption2FromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :option_2, :string
  end
end
