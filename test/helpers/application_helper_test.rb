require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Resume"
    assert_equal full_title("Contact"), "Contact | Resume"
  end
end