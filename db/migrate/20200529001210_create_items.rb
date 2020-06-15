class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :task
      t.boolean :completed

      t.timestamps
    end
  end
end
