module ApplicationHelper
  def avatar_url(user)
    user.facebook_picture_url || "https://avatars2.githubusercontent.com/u/18313150?v=3&u=ebea9da5f193229a8bbcc69db817da26a0f805e6&s=400"
  end
end
