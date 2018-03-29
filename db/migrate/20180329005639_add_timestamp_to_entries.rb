class AddTimestampToEntries < ActiveRecord::Migration[5.1]
  def change
    add_column :entries, :timestamp, :datetime
  end
end
