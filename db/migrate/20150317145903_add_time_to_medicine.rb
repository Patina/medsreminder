class AddTimeToMedicine < ActiveRecord::Migration
  def change
    add_column :medicines, :reminder_time, :datetime
  end
end
