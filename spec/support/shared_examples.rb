shared_examples "require_admin_sign_in" do
  it "should redirect_to root path if not logged in" do
    clear_current_user
    set_regular_user
    action
    expect(response).to redirect_to root_path
  end
end

shared_examples "require_regular_sign_in" do
  it "should redirect_to login path if not logged in" do
    clear_current_user
    action
    expect(response).to redirect_to login_path
  end
end
