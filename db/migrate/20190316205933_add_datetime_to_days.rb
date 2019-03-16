class AddDatetimeToDays < ActiveRecord::Migration[5.2]
  def change
    add_column :days, :datetime, :datetime
  end
end
