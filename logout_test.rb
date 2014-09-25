require 'rubygems'
require 'bundler/setup'
Bundler.require

class LogoutTest < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://www.caregeneral.net/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end

  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end

  def test_logout_test
    @selenium.set_speed "0"
    @selenium.open "/login"
    @selenium.type "id=user_email", "neerajdnjj@gmail.com"
    @selenium.type "id=user_password", "welcome"
    @selenium.click "css=button.common-btn"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert_equal "×Invalid email or password.", @selenium.get_text("css=div.alert.fade.in.alert-danger.alert-dismissable")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "css=button.close"
    @selenium.type "id=user_email", "neeraj12@bigbinary.com"
    @selenium.type "id=user_password", "welcomee"
    @selenium.click "css=button.common-btn"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert_equal "×Invalid email or password.", @selenium.get_text("css=div.alert.fade.in.alert-danger.alert-dismissable")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "css=button.close"
  end
end
