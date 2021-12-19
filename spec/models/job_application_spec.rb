require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe 'associations' do
    it { should belong_to(:job) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:email) }
    it { should_not allow_value('Abc.example.com').for(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_numericality_of(:phone) }
    it { should validate_length_of(:phone).is_at_most(15) }
    it { should validate_length_of(:phone).is_at_least(9) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:professional_qualifications) }
    it { should validate_presence_of(:resume) }
  end
end
