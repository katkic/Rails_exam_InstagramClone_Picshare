module ApplicationHelper
  def image_set(target)
    target.image? ? target.image.url : 'default.png'
  end
end
