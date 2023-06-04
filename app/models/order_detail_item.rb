class OrderDetailItem < ApplicationRecord
  belongs_to :itemable, polymorphic: true
  belongs_to :orderable, polymorphic: true
  # after_save :update_total_price

  # private

  # def update_total_price
  #   order_detail_items = order_detail.order_detail_items
    
  #   order_details_groupped = order_detail_items.group_by(:itemable_type, :itemable_id)


  # end
end
