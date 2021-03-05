# frozen_string_literal: true

class ItemOrderService
  def call(positioned_item)
    index = positioned_item.position
    items = positioned_item.user.items.where(group_id: positioned_item.group_id)
    items.where.not(id: positioned_item.id).where('position >= ?', index).order(:position).each do |item|
      index += 1
      item.update!(position: index)
    end
  end
end
