require 'rails_helper'

RSpec.describe CouponsStored, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:user)
    end
  end

  describe 'has_and_belong_to_many' do
    it 'has_and_belongs_to_many' do
      should have_and_belong_to_many(:coupons)
    end
  end
end
