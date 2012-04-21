require 'spec_helper'

describe Thought do

  before(:each) do
    @project = Factory(:project)
    @attr = { :content => "value for content" }
  end

  it "should create a new instance given valid attributes" do
    @project.thought.create!(@attr)
  end
  
  describe "validations" do

    it "should require a project id" do
      Thought.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @project.thoughts.build(:content => "  ").should_not be_valid
    end

  end

  describe "project associations" do

    before(:each) do
      @thought = @project.thoughts.create(@attr)
    end

    it "should have a project attribute" do
      @thought.should respond_to(:project)
    end

    it "should have the right associated project" do
      @thought.project.should == @project.id
      @thought.project.should == @project
    end
  end
end