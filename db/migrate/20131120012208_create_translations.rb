class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :translated_id
      t.string :translated_type
      t.integer :language_id
      t.text :content

      t.timestamps
    end
  end
end
