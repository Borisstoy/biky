module ApplicationHelper
  def avatar_url(user)
    user.facebook_picture_url || cl_image_path(user.photo.path)
  end
end
