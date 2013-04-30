class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  before_filter :check_url

def check_url
  url = request.url
  if url.include?('facebook')
    redirect_to ('http://www.prism-staging12.herokuapp.com/users/auth/facebook')        
  end
end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def default_url_options(options = {})
    options.merge!({ :locale => I18n.locale })
  end


end
