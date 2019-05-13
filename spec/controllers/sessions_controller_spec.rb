require 'rails_helper'

RSpec.describe SessionsController do
  let(:user_test) { Fabricate(:user) }
  subject {session[:user_id]}

  describe "GET new" do
    it "renders login template for unauthenticated user" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST create" do
    context "with valid credentials" do
      before do
        post :create, params: {password: 'password', username: user_test.username}
      end
      
      it "sets session id" do
        expect(subject).to be_truthy
      end
      it "redirects to root path" do
        expect(response).to redirect_to(root_path)
      end
    end
    
    context "with invalid credentials" do
      before do
        post :create, params: {password: '', username: user_test.username}
      end
      
      it "flashes an error" do
        expect(flash[:error]).not_to be_blank    
      end
      
      it "session id is nil" do
        expect(subject).to be_nil
      end
      it "renders new template" do
        expect(response).to render_template(:new)
      end
    end
  end
  describe "DELETE destroy" do
    before do
      post :create, params: {password: 'password', username: user_test.username}
      delete :destroy
    end
  
    it "sets session to nil" do
      expect(subject).to be_nil
    end
    it "redirects to login page" do
      expect(response).to render_template(:new)
    end
  end
end