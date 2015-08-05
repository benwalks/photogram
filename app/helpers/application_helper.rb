module ApplicationHelper
  def alert_for(flash_type)
      {
          :success => 'alert-success text-center',
          :error => 'alert-danger text-center',
          :alert => 'alert-warning text-center',
          :notice => 'alert-info text-center'
      }[flash_type.to_sym] || flash_type.to_s
  end

  def default_form_image(post)
    if post.image.exists?
      image_tag post.image.url(:medium), id: 'image-preview', class: 'img-responsive'
    else
      image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end

end
