class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user  #defined below, and occurs before all actions take place
  before_action :require_logged_in, expect: [:new, :create, :home]



        def logged_in?
          #current_user.id != nil
          !!current_user
        end

        private
        def current_user
        #  binding.pry
          @current_user ||= User.find(session[:user_id]) if session[:user_id]
        end
        #lets send the user to a login screen if they arent logged in
        def require_logged_in
          return redirect_to root_path unless logged_in?
        end
        helper_method :current_user
end



#solution

# =>          def logged_in?
# =>            !!current_user
# =>          end
# =>
# =>          private
# =>            def require_logged_in
# =>              redirect_to root_path unless logged_in?
# =>            end
# =>
# =>            def current_user
# =>              @current_user ||= User.find(session[:user_id]) if session[:user_id]
# =>            end
# =>            helper_method :current_user
# =>          end
