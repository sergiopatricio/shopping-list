# frozen_string_literal: true

module ApplicationHelper
  FLASH_CLASSES = {
    'notice' => 'alert alert-primary',
    'success' => 'alert alert-success',
    'error' => 'alert alert-danger',
    'alert' => 'alert alert-warning'
  }.freeze

  def flash_class(name)
    FLASH_CLASSES[name]
  end
end
