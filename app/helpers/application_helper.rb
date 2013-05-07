module ApplicationHelper

  def title
    base_title = "Prism"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
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
    default_url = "#{root_url}images/guest.jpg"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end

#    default_url = "#{root_url}images/guest.png"
# url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"