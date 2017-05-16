class WebObjectFormPage < WebObject

  element :delayed_alert_button, {:id => 'alert_button'}

  element :toggle_visibility_button, {:id => 'toggle_visibility'}
  element :toggle_visibility_text, {:id => 'visible_text'}

  element :toggle_presence_button, {:id => 'toggle_presence'}
  element :toggle_presence_link, {:id => 'toggle_presence_link'}, error=false

  element :toggle_enability_button, {:id => 'enable_button'}
  element :toggle_enability_field, {:id => 'enable_field'}

  element :delayed_clickability_button, {:id => 'delayed_clickability'}
  element :desired_clickable_button, {name: 'clickable_button'}

  element :toggle_attribute_button, {:id => 'toggle_attribute'}
  element :empty_attribute_button, {:id => 'empty_attribute'}


  def wait_for_text_visibility(state)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if state=="visible"
      # puts ExpectedConditions.instance_methods
      wait.until{element_is_visible(toggle_visibility_text)}
    else
      wait.until{element_is_invisible(toggle_visibility_text)}
    end
  end

  def wait_for_link_presence(state)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if state=="present"
      wait.until{element_is_present(:id => 'toggle_presence_link')}
    else
      wait.until{element_is_absent(:id => 'toggle_presence_link')}
    end
  end

  def wait_for_field_to_be_enabled(state)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if state=="enabled"
      wait.until{element_is_enabled(toggle_enability_field)}
    else
      wait.until{element_is_disabled(toggle_enability_field)}
    end
  end

  def wait_for_button_to_be_clickable
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    wait.until{element_is_clickable(desired_clickable_button)}
  end

  def wait_for_attribute(state)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if state=="present"
      wait.until{attribute_is_present(toggle_attribute_button,'style')}
    else
      wait.until{attribute_is_absent(toggle_attribute_button,'style')}
    end
  end

  def wait_for_attribute_value(state)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if state=="set"
      wait.until{attribute_is_not_empty(empty_attribute_button,'style')}
    else
      wait.until{attribute_is_empty(empty_attribute_button,'style')}
    end
  end

  def wait_for_attribute_value_match(action)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    if action=="match"
      wait.until{attribute_to_match(toggle_attribute_button, 'style', 'color: red;')}
    else
      wait.until{attribute_to_contain(toggle_attribute_button, 'style', 'red')}
    end
  end

end