module TweetsHelper
  def user_image
    user = User.find(current_user.id)
    return user.image
  end
end
