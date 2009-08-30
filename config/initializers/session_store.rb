# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_a_session',
  :secret      => 'f3f377257417402cab4db6ebc0fb4f9112f56accf319892a6b7e6eb831a032ec85cf9ff63e807780549eed533f9a076e7fa8f7f99dae9eafceb8379ba9250c3b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
