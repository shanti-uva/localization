class CreateContexts < ActiveRecord::Migration
  def change
    create_table :contexts do |t|
      t.text :key
      t.integer :message_id
      t.integer :document_id

      t.timestamps
    end
  end
end
