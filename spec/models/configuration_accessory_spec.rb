require 'rails_helper'

RSpec.describe ConfigurationAccessory, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:accessory)
    end
  end
end
