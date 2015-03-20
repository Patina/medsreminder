class AddLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Last_name, :string
  end
end
