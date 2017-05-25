module UsersHelper

  # Return Gravatar for the given user
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
    # this final line is the return value of gravatar_for (an image tag)
  end

end
