class User < ApplicationRecord
  has_one :shipping_address
  has_many :orders
  has_one :cart
  has_many :coupons_storeds
  has_one_attached :avatar
  devise :database_authenticatable, :registerable, :recoverable, stretches: 13

  after_create :initialize_cart
  before_create :random_name

  def thumbnail    
    if avatar.blank?
      'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp'
    else
      avatar
    end
  end

  private

  def initialize_cart
    cart = Cart.new(
      user_id: id,
      total_price: 0
    )

    cart.save
  end

  def random_name
    self.name = SecureRandom.hex(10)
  end
end
