class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.text :text
      t.datetime :datetime

      t.timestamps
    end
  end
end
