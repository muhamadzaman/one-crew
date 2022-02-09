require 'rails_helper'

RSpec.describe Job, type: :model do
  context 'by default factory' do
    let(:job) { build(:job) }

    it { expect(job).to be_valid }
    it { expect(job.name).to be }
    it { expect(job.address).to be }
    it { expect(job.description).to be }
  end

  describe 'validations' do
    let!(:model) { create(:job) }

    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it 'shoulda associations' do
      should belong_to(:user)
      should have_many(:estimates)
    end
  end
end
