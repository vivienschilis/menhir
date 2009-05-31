# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def controller_is_selected(controller_name)
    controller.controller_name == controller_name ? 'active' : ''
  end
  
  def set_focus_to_id(id)
      javascript_tag("
       Event.observe(window, 'load', function() {
        $('#{id}').focus();
        })");
  end
  
  def hide_messsage(class_message)
      javascript_tag("
       Event.observe(window, 'load', function() {
        e=$$('div.message."+class_message+"').reduce()
        new PeriodicalExecuter(function(pe) {
            e.hide()
            pe.stop();
        }, 5);
      })");
  end
  
  def shake_login_on_error
      javascript_tag("
       Event.observe(window, 'load', function() {
    			Effect.Shake('block-login');
      })");
  end
  
end
