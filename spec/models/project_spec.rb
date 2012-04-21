require 'spec_helper'

describe Project do

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :body=> "value for body",
      :title=> "value for title",
    }
  end

  it "should create a new instance given valid attributes" do
    @user.projects.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @project = @user.projects.create(@attr)
    end
    
    it "should have a user attribute" do
      @project.should respond_to(:user)
    end
    
    it "should have the right associated user" do
      @project.user_id.should == @user.id
      @project.user.should == @user
    end
  end
  
  describe "thought associations" do
    
    before(:each) do
      @project = Project.create(@attr)
      @t1 = Factory(:thought, :project => @project, :created_at => 1.day.ago)
      @t2 = Factory(:thought, :project => @project, :created_at => 1.hour.ago)
    end
    
    it "should have a thoughts attribtue" do
      @project.should respond_to(:thoughts)
    end
    
    it "should have thoughts in the right order" do
      @project.thoughts.should == [@t2, @t1]
    end

  describe "validations" do
    
    it "should require a user id" do
      Project.new(@attr).should_not be_valid
    end
  
  end

end