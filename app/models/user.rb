class User < ApplicationRecord
  has_one :shipping_address
  has_many :orders
  has_one :cart
  has_one_attached :avatar
  devise :database_authenticatable, :registerable, :recoverable, stretches: 13

  def thumbnail
    return avatar.url if avatar.attached?

    'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp'
  end
end
