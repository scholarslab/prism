Airbrake.configure do |config|
  config.api_key = '1f17e220bf987606b12277e9d9ec76ae'
  config.host    = 'slab-errbit.herokuapp.com'
  config.port    = 80
  config.secure  = config.port == 443
end
