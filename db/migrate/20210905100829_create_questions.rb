class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :answer

      t.timestamps
    end
  end
end
