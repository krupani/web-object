require 'selenium-webdriver'
require 'web-object/element'
require 'web-object/elements'

require 'web-object/conditions/alert'
require 'web-object/conditions/element_interaction'
require 'web-object/conditions/element_property'
require 'web-object/conditions/url_n_title'
require 'web-object/conditions/window_n_frame'


class WebObject
  include Element
  include Elements

  def initialize(driver)
    @driver = driver
  end

  singleton_class.send(:alias_method, :find, :element)
  singleton_class.send(:alias_method, :element_list, :elements)
  singleton_class.send(:alias_method, :all, :elements)

end

PageObject = WebObject