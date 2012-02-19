require 'spec_helper'

describe "LayoutLinks" do
  
  describe "GET /layout_links" do
    
    it "should have a home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Scratchboard")
    end
    
    it "should have an about page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end
  
    it "should have the signup page at '/getstarted'" do
      get '/getstarted'
      response.should have_selector('title', :content => "Get started")
    end
    
  end
  
  describe "when not signed in" do
    
    it "should have the signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path, :content => "Sign in")
    end
  end
  
  describe "when signed in" do
    
    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end
    
    it "should have the signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path, :content => "Sign out")
    end
  
    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user), :content => "Profile")
    end
  
  end
  
end