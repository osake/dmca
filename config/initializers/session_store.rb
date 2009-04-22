# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dmca_session',
  :secret      => 'de62a4c318504eb858b6fcaaf4d78a2b75de090ead0348774b21fab457ad7dd4b20fb6d747ada6d200f07e004e7394cacb83efeaab17012ba76d48557eda8bf5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
