require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has_one' do
      should have_one(:shipping_address)
      should have_one(:cart)
    end

    it 'has_one_attached' do
      should have_one_attached(:avatar)
    end

    it 'has_many' do
      should have_many(:orders)
      should have_many(:coupons_storeds)
    end
  end
end
