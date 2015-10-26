module ApplicationHelper
  def active_action(action)
    controller_action = "#{controller.controller_name}/#{controller.action_name}"
    return 'default' if controller_action == action
    return 'danger'
  end

  def row_class(room)
    return "success" if room.starts_at.to_date.today?
    return "warning" if room.starts_at.to_date.future?
  end
end
