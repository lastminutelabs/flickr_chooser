# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'd46446d238026271036fa45a84613c81'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  

   before_filter :authenticate


   private

   
   def authenticate

     # if you want add USER_NAME="useranme" and PASSWORD="password" to config/initalizers/password.rb

     if USER_NAME && PASSWORD
       authenticate_or_request_with_http_basic do |user_name, password|
         user_name == USER_NAME && password == PASSWORD
       end
     else
       true
     end
   end

  
  
end
