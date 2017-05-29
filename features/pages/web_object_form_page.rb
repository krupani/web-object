class WebObjectFormPage < WebObject

  element :body_element, {:tag_name => 'body'}
  element :delayed_alert_button, {:id => 'alert_button'}

  element :toggle_visibility_button, {:id => 'toggle_visibility'}
  element :toggle_visibility_text, {:id => 'visible_text'}

  element :toggle_presence_button, {:id => 'toggle_presence'}
  element :toggle_presence_div, {:id => 'presence'}
  element :toggle_presence_link, {:id => 'toggle_presence_link'}, error=false

  element :toggle_enability_button, {:id => 'enable_button'}
  element :toggle_enability_field, {:id => 'enable_field'}

  element :delayed_clickability_button, {:id => 'delayed_clickability'}
  element :desired_clickable_button, {name: 'clickable_button'}

  element :toggle_attribute_button, {:id => 'toggle_attribute'}
  element :empty_attribute_button, {:id => 'empty_attribute'}
  
  element :delayed_url_button, {:id => 'delayed_url'}
  element :delayed_title_button, {:id => 'delayed_title'}

  element :delayed_more_cells_button, {:id => 'delayed_more_cells'}
  element :delayed_less_cells_button, {:id => 'delayed_less_cells'}
  elements :count_of_cells, {:css => 'tr#row>td'}

  def initialize(driver)
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    super(driver)
  end

  def wait_for_text_visibility(state)
    if state=="visible"
      # puts ExpectedConditions.instance_methods
      @wait.until{element_is_visible(toggle_visibility_text)}
    else
      @wait.until{element_is_invisible(toggle_visibility_text)}
    end
  end

  def wait_for_link_presence(state)
    if state=="present"
      @wait.until{element_is_present(:id => 'toggle_presence_link')}
    else
      @wait.until{element_is_absent(:id => 'toggle_presence_link')}
    end
  end

  def wait_for_field_to_be_enabled(state)
    if state=="enabled"
      @wait.until{element_is_enabled(toggle_enability_field)}
    else
      @wait.until{element_is_disabled(toggle_enability_field)}
    end
  end

  def wait_for_button_to_be_clickable
    @wait.until{element_is_clickable(desired_clickable_button)}
  end

  def wait_for_attribute(state)
    if state=="present"
      @wait.until{attribute_is_present(toggle_attribute_button,'style')}
    else
      @wait.until{attribute_is_absent(toggle_attribute_button,'style')}
    end
  end

  def wait_for_attribute_value(state)
    if state=="set"
      @wait.until{attribute_is_not_empty(empty_attribute_button,'style')}
    else
      @wait.until{attribute_is_empty(empty_attribute_button,'style')}
    end
  end

  def wait_for_attribute_value_match(action)
    if action=="match"
      @wait.until{attribute_to_match(toggle_attribute_button, 'style', 'color: red;')}
    else
      @wait.until{attribute_to_contain(toggle_attribute_button, 'style', 'red')}
    end
  end
  
  def wait_for_url(action, expected)
    if action=="match"
      @wait.until{url_to_match(expected)}
    else
      @wait.until{url_to_include(expected)}
    end
  end

  def wait_for_title(action, expected)
    if action=="match"
      @wait.until{title_to_match(expected)}
    else
      @wait.until{title_to_include(expected)}
    end
  end

  def wait_for_text_presence(txt)
    @wait.until{text_to_be_on_page(txt)}
  end

  def wait_for_text_in_element(action, ele, txt)
    if action == "present"
      @wait.until{text_in_element_to_match(ele,txt)}
    elsif action == 'included'
      @wait.until{text_in_element_to_include(ele,txt)}
    else
      @wait.until{text_in_element_to_contain(ele,txt)}
    end
  end

  def wait_for_element_count(type,count)
    if type == 'greater'
      waiting(10).until{elements_count_to_be_more_than({:css=>'#row>td'}, count)}
    elsif type == 'less'
      waiting(10).until{elements_count_to_be_less_than({:css=>'#row>td'}, count)}
    else
      waiting(10).until{elements_count_to_be_equal_to({:css=>'#row>td'}, count)}
    end
  end

end