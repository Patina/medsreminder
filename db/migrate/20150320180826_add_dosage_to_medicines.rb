class AddDosageToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :dosage, :string
  end
end
