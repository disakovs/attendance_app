require 'rails_helper'

RSpec.describe UsersController do
  before do 
    set_admin_user
  end
  
  describe "GET index" do
    it "sets @user" do 
      get :index
      expect(assigns(:user)).to be_instance_of(User)
    end
    
    it "sets @user" do 
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
    
    it_behaves_like "require_admin_sign_in" do
      let(:action) { get :index}
    end
  end
  
  describe "POST create" do
  
    context "with valid input" do
      before {post :create, params: {user: { username: "bob", password: 'password', role: 'teacher'}}}
      
      it "creates the user" do
        expect(User.count).to eq(2)
      end
      
      it "redirects to the root page" do
        expect(response).to redirect_to root_path
      end
      
    end
    
    context "with invalid input" do
      before { post :create, params: {user: { password: 'password', role: 'teacher'}} }
      
      it "does not create the user" do
        expect(User.count).to eq(1)
      end
      
      it "render the :index template" do
        expect(response).to render_template(:index)
      end
      
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of(User)
      end
      
    end
    
    context "logged out user" do
      it_behaves_like "require_admin_sign_in" do
        let(:action) {post :create, params: {user: { username: "bob", password: 'password', role: 'teacher'}}}
      end
    end
     
  end
  
end
