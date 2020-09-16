module ApplicationHelper
	def avatar_url(user)
    return user.profile_image_id unless user.profile_image_id.nil?
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg"
  end
end
