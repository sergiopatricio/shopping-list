# frozen_string_literal: true

module GroupOwnership
  extend ActiveSupport::Concern

  def check_group_ownership(item)
    return if item.group_id.blank?

    item.group_id = nil if current_user.groups.where(id: item.group_id).empty?
  end
end
