require 'rails_helper'

RSpec.describe Configuration, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:product)
    end
  end
end
