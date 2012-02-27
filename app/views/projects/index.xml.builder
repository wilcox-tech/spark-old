xml.instruct!
xml.projects do
  @projects.each do |project|
    xml.name project.name
    xml.desc project.desc
    xml.updated_at project.updated_at
  end
end