require 'spec_helper'

describe "Authentication:" do
  
  subject { page }

  describe "Logging in" do
    before { visit login_path }
    
    it { should have_selector('h1', :text => "Log in") }
    it { should have_selector('title', :text => "Log In") }
    describe "with a valid account" do
      before do
        fill_in "Username", :with => 'SparkTesting'
        fill_in "Password", :with => '36harrier)PPC603ev?'
        click_button "Log In"
      end
      
      it { should have_link('Log Out', :href => logout_path) }
      it { should_not have_link('Log In', :href => login_path) }
      it { should_not have_selector('title', :text => "Log In") }
    end
    describe "should only allow valid attempts" do
      before do
        click_button "Log In"
      end
      
      it { should have_selector('title', :text => "Log In") }
      it { should have_selector('div.flash.error') }
    end
    describe "should only allow valid user names" do
      before do
        fill_in "Username", :with => 'This does not exist'
        fill_in "Password", :with => 'hi'
        click_button "Log In"
      end
      
      it { should have_selector('title', :text => "Log In") }
      it { should have_selector('div.flash.error') }
    end
    describe "should create a new session" do
    end
  end
  
  describe "Logging out" do
    before { visit logout_path }
    
    it "should only work if already logged in"
    it "should destroy the session"
  end
  
end
