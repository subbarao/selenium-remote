require 'rubygems'
require 'bundler/setup'
Bundler.require

class LoginTest < Test::Unit::TestCase

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

  def test_login_test
    @selenium.open "/login"
    begin
        assert @selenium.is_element_present("css=a.logo.navbar-brand")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Account login", @selenium.get_text("css=h1.page-title")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "", @selenium.get_text("id=user_email")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    assert_equal "", @selenium.get_text("id=user_password")
    begin
        assert_equal "Forgot password", @selenium.get_text("link=Forgot password")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Contact Us", @selenium.get_text("link=Contact Us")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Login", @selenium.get_text("css=button.common-btn")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "", @selenium.get_text("id=badge-app-store")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Text me the link", @selenium.get_text("link=Text me the link")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Privacy Policy", @selenium.get_text("link=Privacy Policy")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Terms of Service", @selenium.get_text("link=Terms of Service")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.type "id=user_email", "prabhakar+superadmin@bigbinary.com"
    @selenium.type "id=user_password", "welcome"
    @selenium.click "css=button.common-btn"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert_equal "prabhakar+superadmin", @selenium.get_text("css=span.user_name")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "My Info", @selenium.get_text("link=My Info")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Super Admin", @selenium.get_text("link=Super Admin")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Admin", @selenium.get_text("link=Admin")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Help", @selenium.get_text("link=Help")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Getting Started", @selenium.get_text("link=Getting Started")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Get Mobile App", @selenium.get_text("link=Get Mobile App")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Contact Us", @selenium.get_text("link=Contact Us")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Feedback and Suggestions", @selenium.get_text("link=Feedback and Suggestions")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Espanol", @selenium.get_text("link=Espanol")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert_equal "Log Out", @selenium.get_text("link=Log Out")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
  end
end
