require 'rails_helper'

RSpec.describe EstimateDetail, type: :model do
  context 'by default factory' do
    let(:estimate_detail) { build(:estimate_detail) }

    it { expect(estimate_detail).to be_valid }
    it { expect(estimate_detail.unit_of_measure).to be }
    it { expect(estimate_detail.units).to be }
    it { expect(estimate_detail.time).to be }
    it { expect(estimate_detail.rate).to be }
    it { expect(estimate_detail.cost).to be }
    it { expect(estimate_detail.margin_multiple).to be }
    it { expect(estimate_detail.estimate_category).to be }
    it { expect(estimate_detail.unit_of_measure).to be }
  end

  describe 'validations' do
    let!(:model) { create(:estimate_detail) }

    it { should validate_presence_of(:job) }
    it { should validate_presence_of(:units) }
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:cost) }
    it { should validate_presence_of(:estimate_category) }
    it { should validate_presence_of(:unit_of_measure) }
  end

  context 'associations' do
    it 'shoulda associations' do
      should belong_to(:estimate)
    end
  end
end
