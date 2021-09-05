require 'rails_helper'

RSpec.describe Job, type: :model do
  describe 'associations' do
    it { should have_many(:job_applications) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it {should validate_presence_of(:creator_id) }
    it {should validate_presence_of(:category) }
    it {should validate_presence_of(:expiring_date) }
  end
end