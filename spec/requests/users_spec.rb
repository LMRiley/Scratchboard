require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    #describe "failure" do
      
      #it "should not make a new user" do
        #lambda do
         # visit getstarted_path
          #fill_in "Your name",              :with => ""
          #fill_in "Email",             :with => ""
          #fill_in "Password",          :with => ""
          #fill_in "Confirm password",  :with => ""
          #click_button
          #response.should render_template('users/new')
          #response.should have_selector('div#error_explanation')
        #end.should_not change(User, :count)
      #end
    #end
  
    #describe "success" do
      
      #it "should create a new user" do
        #lambda do
          #visit getstarted_path
          #fill_in "Your name",         :with => "Neil Kamireddy"
          #fill_in "Email",             :with => "example@email.com"
          #fill_in "Password",          :with => "testpassword"
          #fill_in "Confirm password",  :with => "testpassword"
          #click_button
          #response.should have_selector("div.flash.success", :content => "Scratchboard")
          #response.should render_template('users/show')
        #end.should change(User, :count).by(1)
      #end
    
    #end
  
  end

  describe "signin/signout" do
    
    describe "failure" do
      
      it "should not sign the user in" do
        visit signin_path
        fill_in :email,     :with => ""
        fill_in :password,  :with => ""
        click_button
        controller.should_not be_signed_in
      end
    
    end
    
    describe "success" do
      
      it "should sign the user in and then out" do
        user = Factory(:user)
        visit signin_path
        fill_in :email,     :with => user.email
        fill_in :password,  :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Log out"
        controller.should_not be_signed_in
      end
    
    end
    
  end
  
end