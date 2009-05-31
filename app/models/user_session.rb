class UserSession < Authlogic::Session::Base
  
  remember_me_for 1.weeks
  self.find_by_login_method= "find_by_login_or_email"
  
end