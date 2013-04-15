# Be sure to restart your server when you modify this file.

Testing::Application.config.session_store :cookie_store, key: '_testing_session', :httponly => true

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
 
 # My bet is that "Testing" in the code below will probably need to be changed to our app name - "Prism" - when we change the tokens out. Now my dummy testing app is called "Testing"
 #Testing::Application.config.session_store :active_record_store
