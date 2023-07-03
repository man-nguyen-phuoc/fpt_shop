require 'rails_helper'

RSpec.describe Accessory, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should have_one(:configuration_accessory).dependent(:destroy) }
    it { should have_many(:order_detail_items) }
  end

  describe 'validations' do
    it 'length validation' do
      should validate_length_of(:name).is_at_least(6).is_at_most(20)
    end

    # it 'comparison validation' do
    #   should validate_comparison_of(:price).greater_than(2_000_000)
    # end
    
      
    it 'numbericality validation' do
      should validate_numericality_of(:discount).is_in(0..100)
    end
  end
end
