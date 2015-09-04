module ApplicationHelper

def active_action(action)
  controller_action = "#{controller.controller_name}/#{controller.action_name}"
  return 'active-li' if controller_action == action
  return 'non-active'
end

end
