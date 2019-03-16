class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.references :vacancy, foreign_key: true
      t.references :user, foreign_key: true
      t.string :resume_id
      t.string :resume_filename
      t.string :resume_size
      t.string :resume_content_type
      t.string :cover_letter_id
      t.string :cover_letter_filename
      t.string :cover_letter_size
      t.string :cover_letter_content_type

      t.timestamps
    end
  end
end
