class OrderDetailItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :orderable, polymorphic: true

  def total_price
    itemable.real_price * quantity
  end
end
