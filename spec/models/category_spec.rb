require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has_many' do
    should have_many(:accessories).dependent(:destroy)
    should have_many(:products).dependent(:destroy)
  end

  it 'has_and_belongs_to_many' do
    should have_and_belong_to_many(:manufactures)
  end
end
