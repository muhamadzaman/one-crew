require 'rails_helper'

RSpec.describe Estimate, type: :model do
  context 'by default factory' do
    let(:estimate) { build(:estimate) }

    it { expect(estimate).to be_valid }
    it { expect(estimate.name).to be }
    it { expect(estimate.description).to be }
  end

  context 'associations' do
    it 'shoulda associations' do
      should belong_to(:user)
      should belong_to(:job)
      should have_many(:estimate_details)
    end
  end
end
