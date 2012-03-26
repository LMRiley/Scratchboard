require 'spec_helper'

describe UsersController do
  render_views
  
  describe "GET 'show'" do
    
    before(:each) do
      @user = Factory(:user)
      
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
    
    it "should show the list of projects for that user" do
      project1 = Factory(:project, :user => @user, :body => "test text 1")
      project2 = Factory(:project, :user => @user, :body => "test text 2")
      get :show, :id => @user
      response.should have_selector("span.body", :body => project1.body)
      response.should have_selector("span.body", :body => project2.body)    
    end
    end

  end
 
  describe "GET 'new'" do
    
    it "should be successful" do
      get 'new'
      response.should be_success
    end
    
  end

  describe "POST 'create'" do
    
    describe "failure" do
      
      before (:each) do
        @attr = {:name =>"", :email => "", :password => "", :password_confirmation => "" }
      end
       
      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Get started")
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
      
    end
    
    describe "success" do
      
      before(:each) do
        @attr = {:name => "Neil Kamireddy", :email => "test@example.com", 
                 :password => "testpassword", :password_confirmation => "testpassword"}
      end
      
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end
      
      it "should redirect to the user 'show' page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
      
      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end
      
    end
    
  end

end
