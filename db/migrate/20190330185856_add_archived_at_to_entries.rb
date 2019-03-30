class AddArchivedAtToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :archived_at, :datetime
  end
end
