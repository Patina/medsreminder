class AddSentToMedicine < ActiveRecord::Migration
  def change
    add_column :medicines, :sent, :boolean
  end
end
