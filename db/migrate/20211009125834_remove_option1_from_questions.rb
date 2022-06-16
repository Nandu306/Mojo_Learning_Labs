class RemoveOption1FromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :option_1, :string
  end
end
