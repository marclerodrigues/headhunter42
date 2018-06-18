require 'rails_helper'

RSpec.describe UserCreator do
  describe ".create" do
    subject { described_class }

    context "with valid attributes" do
      let(:valid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name,
          email: FFaker::Internet.email
        }
      end

      it "calls invite on user" do
        expect_any_instance_of(User).to receive(:invite!)
        subject.create(valid_attributes)
      end

      it "creates a new user" do
        expect {
          subject.create(valid_attributes)
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      let(:invalid_attributes) do
        {
          first_name: FFaker::NameBR.first_name,
          last_name: FFaker::NameBR.last_name
        }
      end

      it "does not create an user" do
        expect {
          subject.create(invalid_attributes)
        }.not_to change(User, :count)
      end

      it "does not call invite on user" do
        expect_any_instance_of(User).not_to receive(:invite!)
        subject.create(invalid_attributes)
      end
    end
  end
end
