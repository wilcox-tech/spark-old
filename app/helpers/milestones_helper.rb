module MilestonesHelper
  def completion_text_for(milestone)
    return "<em>Not yet completed</em>".html_safe if milestone.completed_on.nil?
    "Completed on: <strong>#{milestone.completed_on}</strong>".html_safe
  end
end
