module ApplicationHelper

  def title(page_title)
    content_for(:title) { " | #{page_title}" }
  end

  def page_id
    base_id = "prism"
    if @title.nil?
      base_id
    else
      @title.gsub(/ /, '_').downcase
    end
  end

  # Use this with <%= image_tag avatar_url(user) %>.
  def avatar_url(user)
    if user.provider == 'facebook'
      url = "http://graph.facebook.com/#{user.uid}/picture?type=square"
    else
      default_url = "http://#{request.env["HTTP_HOST"]}#{image_path('guest.jpg')}"
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      url = "http://gravatar.com/avatar/#{gravatar_id}?s=48&d=#{CGI.escape(default_url)}"
    end

    url
  end
end

#    default_url = "#{root_url}images/guest.png"
# url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
