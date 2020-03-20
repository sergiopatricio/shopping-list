class GroupOrderService
  def call(positioned_group)
    index = positioned_group.position
    Group.where.not(id: positioned_group.id).where('position >= ?', index).order(:position).each do |group|
      index += 1
      group.update!(position: index)
    end
  end
end