require 'rails_helper'

RSpec.describe OrderDetailItem, type: :model do
  describe 'associations' do
    it 'belongs_to' do
      should belong_to(:itemable)
      should belong_to(:orderable)
    end
  end
end
