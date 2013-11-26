class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.integer :language_id
      t.integer :context_id
      t.text :content

      t.timestamps
    end
  end
end
