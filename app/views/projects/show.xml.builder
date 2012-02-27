xml.instruct!
xml.project do
  xml.name @project.name
  xml.desc @project.desc
  xml.updated_at @project.updated_at
  @project.versions.each do |version|
    xml.version do
      xml.codename version.codename unless version.codename.nil?
      xml.name version.name
      xml.target_release version.target_release_date unless version.target_release_date.nil?
      xml.released_on version.actual_release_date unless version.actual_release_date.nil?
    end
  end
end