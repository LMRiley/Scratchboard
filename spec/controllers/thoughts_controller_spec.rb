require 'spec_helper'

describe ThoughtsController do
  render_views

  describe "access control" do
    
    before(:each) do
      @user = Factory(:user)
      @project = Factory(:project)

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
    end
  end

  describe "POST 'create'" do

      before(:each) do
        @user = Factory(:user)
        @project = Factory(:project)

      describe "failure" do

        before(:each) do
          @attr = { :content => "" }
        end

        it "should not create a thought" do
          lambda do
            post :create, :thought => @attr
          end.should_not change(Thought, :count)
        end

        it "should render the home page" do
          post :create, :thought => @attr
          response.should render_template('pages/home')
        end
      
      end

      describe "success" do

        before(:each) do
          @attr = { :content => "Lorem ipsum" }
        end

        it "should create a thought" do
          lambda do
            post :create, :thought => @attr
          end.should change(Thought, :count).by(1)
        end

        it "should redirect to the project page" do
          post :create, :thought => @attr
          response.should redirect_to(@project)
        end

        it "should have a flash message" do
          post :create, :thought => @attr
          flash[:success].should =~ /thought created/i
        end
      end
      end
  end  
end