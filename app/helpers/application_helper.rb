# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def controller_is_selected(controller_name)
  #  request.request_uri.split('/')[1] == controller_name ? 'active' : ''
    controller.controller_name == controller_name ? 'active' : ''
  end
  
  def create_button(title, options={})
    span = content_tag(:span, image_tag("add.png") + "&nbsp;" + title , :class => "button")
    link_to( span, options[:url])
  end
end
