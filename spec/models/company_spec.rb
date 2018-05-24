require "rails_helper"
require "refile/file_double"

RSpec.describe Company, type: :model do
  it "allows attaching an logo" do
    company = Company.new

    company.logo = Refile::FileDouble.new("dummy", "logo.png", content_type: "image/png")
    company.save

    expect(company.logo_id).not_to be_nil
  end

  it "doesn't allow attaching other files" do
    company = Company.new

    company.logo = Refile::FileDouble.new("dummy", "file.txt", content_type: "text/plain")
    company.save

    expect(company.logo_id).to be_nil
  end
end
