require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe 'associations' do
    it 'has_one' do
      should have_one(:order)
    end

    it 'belongs_to' do
      should belong_to(:coupon).optional
    end

    it 'has_many' do
      should have_many(:order_detail_items).dependent(:destroy)
    end
  end
end
