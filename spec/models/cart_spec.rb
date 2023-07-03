require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:user)
    end

    it 'has_many' do
      should have_many(:order_detail_items)
    end
  end
end
