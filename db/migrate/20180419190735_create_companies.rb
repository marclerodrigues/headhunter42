class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :phone_numbers
      t.string :address

      t.timestamps
    end
  end
end
