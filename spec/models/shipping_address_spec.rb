require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:user)
    end
  end
end
