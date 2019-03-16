class AddDayIdToEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :entries, :day, foreign_key: true
  end
end
