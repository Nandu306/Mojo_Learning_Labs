class CreateFlashcards < ActiveRecord::Migration[6.0]
  def change
    create_table :flashcards do |t|
      t.string :subject
      t.string :topic
      t.string :content

      t.timestamps
    end
  end
end
