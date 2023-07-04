require 'rails_helper'
require 'open-uri'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has_one' do
      should have_one(:shipping_address)
      should have_one(:cart)
    end

    it 'has_one_attached' do
      should have_one_attached(:avatar)
    end

    it 'has_many' do
      should have_many(:orders)
      should have_many(:coupons_storeds)
    end
  end

  describe '#thumbnail' do
    let(:user) { create(:user) }

    it 'returns default avatar' do
     thumbnail = 'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp'

     expect(user.thumbnail).to eq(thumbnail)
    end

    it 'returns upload avatar' do
      image = URI.open(Faker::Avatar.image)

      user.avatar.attach(
        {
          io: image,
          filename: 'image.jpg'
        }
      )

      expect(user.thumbnail).to eq(user.avatar)
    end
  end
end
