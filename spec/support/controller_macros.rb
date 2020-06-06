module ControllerMacros
    def login_admin
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in FactoryBot.create(:admin) # Using factory girl as an example
      end
    end
  
  
    def login_employee
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:employee]
        sign_in FactoryBot.create(:employee)
      end
    end
  
    def login_user
      before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in FactoryBot.create(:user)
      end
    end

    module ValidUserHelper
      def signed_in_as_a_valid_user
        @user ||= FactoryGirl.create :user
        sign_in @user # method from devise:TestHelpers
      end
    end
    
    # module for helping request specs
    module ValidUserRequestHelper
    
      # for use in request specs
      def sign_in_as_a_valid_user
        @user ||= FactoryGirl.create :user
        post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
      end
    end
    
    RSpec.configure do |config|
      config.include ValidUserHelper, :type => :controller
      config.include ValidUserRequestHelper, :type => :request
    end


    
  end