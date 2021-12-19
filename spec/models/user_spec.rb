require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:jobs).with_foreign_key('creator_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should_not allow_value('Abc.example.com').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_most(40) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_confirmation_of(:password) }
  end
end
