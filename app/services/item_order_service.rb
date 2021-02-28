# frozen_string_literal: true

class ItemOrderService
  def call(positioned_item)
    # only sort regular items for now
    return if positioned_item.temporary?

    index = positioned_item.position
    items = positioned_item.user.items.regular.where(group_id: positioned_item.group_id)
    items.where.not(id: positioned_item.id).where('position >= ?', index).order(:position).each do |item|
      index += 1
      item.update!(position: index)
    end
  end
end
