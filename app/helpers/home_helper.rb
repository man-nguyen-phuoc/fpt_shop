module HomeHelper
  def next_order_direction(direction)
    direction == 'desc' ? 'asc' : 'desc'
  end
end
