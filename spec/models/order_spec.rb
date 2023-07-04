require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:order_detail).dependent(:destroy)
      should belong_to(:user)
    end
  end
end
