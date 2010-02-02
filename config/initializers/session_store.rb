# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_budgeteer_session',
  :secret      => '8bb65b40d867013cfb5ed74798140a4d44f2ccf9edd3abc1e32415302fc9956455bede16d6ae0d57057d04e4d79fdc97afdf6b9c83c700aae515598b62fc4008'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
