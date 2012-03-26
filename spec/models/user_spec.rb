# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe User do
  
  before (:each) do
    @attr = { 
      :name => "Example User",
      :email => "user@example.com", 
      :password => "scratchboard",
      :password_confirmation => "scratchboard"
    }
  end
  
  it "should create a new instance given valid attributes" do 
    User.create!(@attr)
  end
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  it "should require an email address" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a"*51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@test.com user_b@test.test2.com test.user@test3.edu]
    addresses.each do |address|
    valid_email_user = User.new(@attr.merge(:email => address))
    valid_email_user.should be_valid
    end
  end
  
  it "should not accept invalid email addresses" do
    addresses = %w[user@test,com user@testcom userattest.com]
    addresses.each do |address|
    invalid_email_user = User.new(@attr.merge(:email => address))
    invalid_email_user.should_not be_valid
    end
  end
  
  it "should require unique email addresses - case insensitive" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end
  
describe "project associations" do
  
  before(:each) do 
    @user = User.create(@attr)
    @project1 = Factory(:project, :user => @user, :created_at => 1.day.ago)
    @project2 = Factory(:project, :user => @user, :created_at => 1.hour.ago)
  end
  
  it "should have the projects attribute" do
    @user.should respond_to(:projects)
  end
  
  it "should have the projects in the right order" do
    @user.projects.should == [@project2, @project1]
  end
end

describe "password validations" do

  it "should require a password" do
    User.new(@attr.merge(:password => "", :password_confirmation => "")).
      should_not be_valid
  end

  it "should require a matching password confirmation" do
    User.new(@attr.merge(:password_confirmation => "invalid")).
      should_not be_valid
  end

  it "should reject short passwords" do
    short = "a" * 5
    hash = @attr.merge(:password => short, :password_confirmation => short)
    User.new(hash).should_not be_valid
  end

  it "should reject long passwords" do
    long = "a" * 41
    hash = @attr.merge(:password => long, :password_confirmation => long)
    User.new(hash).should_not be_valid
  end

end

describe "password encryption" do

  before(:each) do
    @user = User.create!(@attr)
  end

  it "should have an encrypted password attribute" do
    @user.should respond_to(:encrypted_password)
  end
  
  it "should set the encrypted password" do
    @user.encrypted_password.should_not be_blank
  end
  
  describe "has_password? method" do

    it "should be true if the passwords match" do
      @user.has_password?(@attr[:password]).should be_true
    end    

    it "should be false if the passwords don't match" do
      @user.has_password?("invalid").should be_false
    end       
  end
  
  describe "authentication method" do
    
    it "should return nil when email and password don't match" do
      wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
      wrong_password_user.should be_nil
    end
    
    it "should return nil for nonexistent users" do
      non_existent_user = User.authenticate("unknown@email.com", @attr[:password])
      non_existent_user.should be_nil
    end
  
    it "should return the matching user upon success" do
      matching_user = User.authenticate(@attr[:email], @attr[:password])
      matching_user.should == @user
    end
  end

end
end
      