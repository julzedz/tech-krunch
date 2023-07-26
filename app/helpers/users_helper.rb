module UsersHelper
  def display_user_photo(user)
    if user.photo.present?
      image_tag(user.photo, class: 'photo', alt: 'User photo', width: 200, height: 150)
    else
      image_tag('photo.jpg', class: 'photo', alt: 'User photo', width: 200, height: 150)
    end
  end
end
