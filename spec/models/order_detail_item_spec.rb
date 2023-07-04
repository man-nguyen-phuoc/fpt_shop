require 'rails_helper'

RSpec.describe OrderDetailItem, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:itemable)
      should belong_to(:orderable)
    end
  end

  describe '#total_price' do
    let(:order_detail) { create(:order_detail)}
    let(:product) { create(:product)}
    let(:order_detail_item) { create(:order_detail_item, itemable: product, orderable: order_detail) }

    it 'returns total_price correct of data' do
      order_detail_item.update(quantity: 3)

      total_price = product.real_price * order_detail_item.quantity
      expect(order_detail_item.total_price).to eq(total_price)
    end
  end
end
