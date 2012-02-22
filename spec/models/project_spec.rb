require 'spec_helper'

describe Project do
  it "should only allow unique project names" do
    expect { Project.new(:name => "Unique Test").save! }.to change(Project, :count)
    expect { Project.new(:name => "Unique Test").save }.not_to change(Project, :count)
  end
  describe "should allow project names to be changed" do
    Project.new(:name => "Something").save!
    project = Project.find_by_name("Something")
    project.name = "Something Else"
    project.save.should == true
    Project.find_by_name("Something Else").should_not == nil
  end
  it "should not allow project names to be changed to already-existing project names"
end
