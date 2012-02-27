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
  describe "should not allow project names to be changed to already-existing project names" do
    p1 = Project.new(:name => "Name Change 1")
    p1.save!
    p2 = Project.new(:name => "Name Change 2")
    p2.save!
    p2.name = "Name Change 1"
    p2.save.should == false
    Project.find_by_name("Name Change 2").should_not == nil
  end
end
