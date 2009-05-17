# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teamshack_session',
  :secret      => 'ffb940968bf076e73910f11fc52f1df14dd785709f72a20e28fa5d47af291f64d07573ed8c5c8a1068430eae234807d37d2ef11ec617a45dc3891c8a69121229'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
