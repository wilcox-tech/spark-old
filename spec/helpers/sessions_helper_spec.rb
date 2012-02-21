require 'spec_helper'

describe SessionsHelper do
  describe "LDAP methods" do
    it "should return nil for a non-existant user's attribs" do
      helper.ldap_user_attrs('doesNotExistAccount').should == nil
    end
    it "should have a valid CN for a valid user's attribs" do
      helper.ldap_user_attrs('SparkTesting').cn.first.should == "Test Account"
    end
    it "should not allow LDAP logins for invalid credentials" do
      helper.ldap_login('invalid','hi').should == false
      helper.ldap_login('SparkTesting','ThisIsNotThePassword').should == false
    end
    it "should allow LDAP logins for valid credentials" do
      helper.ldap_login('SparkTesting','36harrier)PPC603ev?').should == true
    end
  end
end
