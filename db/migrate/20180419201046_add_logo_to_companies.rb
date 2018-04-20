class AddLogoToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :logo_id, :string
    add_column :companies, :logo_filename, :string
    add_column :companies, :logo_content_size, :string
    add_column :companies, :logo_content_type, :string
  end
end
