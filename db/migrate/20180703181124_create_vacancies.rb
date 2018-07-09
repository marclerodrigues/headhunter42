class CreateVacancies < ActiveRecord::Migration[5.1]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.text :description
      t.text :perks
      t.integer :min_salary
      t.integer :max_salary
      t.date :start_date
      t.date :end_date
      t.boolean :active, default: false
      t.references :pipeline, foreign_key: true

      t.timestamps
    end
  end
end
