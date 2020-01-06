module ApplicationHelper
  def flash_class(name)
    case name
    when 'notice' then 'alert alert-primary'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-danger'
    when 'alert' then 'alert alert-warning'
    end
  end
end
