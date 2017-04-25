require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
   def setup
    @user = users(:Julie)
    @other_user = users(:archer)

   end
  
   test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  
    test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
    end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { first_name: @user.first_name,
                                              email: @user.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end
  test "should not allow the admin attribute to be edited via the web" do
    log_in_as(@other_user)
    assert_not @other_user.admin?
    patch user_path(@other_user), params: {
                                    user: { password:              "",
                                            password_confirmation: "",
                                            admin: true } }
    assert_not @other_user.reload.admin?
  end


end