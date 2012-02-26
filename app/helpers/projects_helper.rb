module ProjectsHelper
  def next_version_of(project)
    Version.order('target_release_date ASC').where('project_id = :project AND target_release_date > :today', :project => project.id, :today => Date.today).limit(1)[0]
  end
  
  def prior_version_of(project)
    Version.order('actual_release_date DESC').where('project_id = :project AND actual_release_date <= :today', :project => project.id, :today => Date.today).limit(1)[0]
  end
end
