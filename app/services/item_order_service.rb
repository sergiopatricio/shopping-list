class ItemOrderService
  def call(positioned_item)
    index = positioned_item.position
    items = Item.where(group_id: positioned_item.group_id).where.not(id: positioned_item.id)
    items.where('position >= ?', index).order(:position).each do |item|
      index += 1
      item.update!(position: index)
    end
  end
end
