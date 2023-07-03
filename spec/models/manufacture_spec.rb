require 'rails_helper'

RSpec.describe Manufacture, type: :model do
  describe 'associations' do
    it 'has_and_belongs_to_many' do
      should have_and_belong_to_many(:categories)
    end

    it 'has_many' do
      should have_many(:products).dependent(:destroy)
      should have_many(:accessories).dependent(:destroy)
    end
  end

  describe 'validations' do
    it 'length validation' do
      should validate_length_of(:name).is_at_least(6)
      should validate_presence_of(:name)
    end
  end
end
