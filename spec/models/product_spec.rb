require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'associations' do
    it 'has_one' do
      should have_one(:configuration).dependent(:destroy)
    end

    it 'belongs_to' do
      should belong_to(:category)
      should belong_to(:manufacture)
    end

    it 'has_many' do
      should have_many(:order_detail_items)
    end
  end

  describe 'validations' do
    it 'numericality validation' do
      should validate_numericality_of(:quantity).is_greater_than(0)
    end
  end

  describe '#real_price' do
    let(:product) { create(:product) }

    it 'returns correct data' do
      real_price = product.price - (product.price * product.discount / 100)
      expect(product.real_price).to eq(real_price)
    end
  end
end
