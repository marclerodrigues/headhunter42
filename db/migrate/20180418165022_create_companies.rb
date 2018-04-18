class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.image :logo
      t.string :website
      t.string :prone_number
      t.string :address

      t.timestamps
    end
  end
end
