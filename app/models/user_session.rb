class UserSession < Authlogic::Session::Base
  attr_accessor :account_id
  
  remember_me_for 1.weeks
  self.find_by_login_method= "find_by_login_or_email"
  
  # with_scope(:find_options => {:conditions => ["account_id = ?", @account_id]}) do
  #   find
  # end
  
end