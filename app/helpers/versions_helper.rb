module VersionsHelper
  def active_milestones_for(version)
    active = 0
    version.milestones.each do |milestone|
      active += 1 if milestone.completed_on.nil?
    end
    active
  end
  
  def past_due_milestones_for(version)
    past_due = 0
    version.milestones.each do |milestone|
      next if !milestone.completed_on.nil?
      next if milestone.due_by > Date.today
      past_due += 1
    end
    past_due
  end
end
