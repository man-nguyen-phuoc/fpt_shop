require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'associations' do
    it 'has_and_belongs_to_many' do
      should have_and_belong_to_many(:coupons_storeds)
    end
  end
end
