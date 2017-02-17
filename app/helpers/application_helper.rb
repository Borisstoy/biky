module ApplicationHelper
  def avatar_url(user)
    if user.photo.nil?
      user.facebook_picture_url || image_path("helmet.png")
    else
      cl_image_path(user.photo.path)
    end
  end
end
