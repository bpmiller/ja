# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ja_session',
  :secret      => '2e2bc6adb0d8ea5bb59a520155f22fc6f38112a8d14ebb13d6d4671faf7dbb5a063e03a6074fdeb5f56f2a8930d13f3627d742a546c50d9891c85c44f70c2652'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
