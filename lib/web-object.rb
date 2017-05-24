require 'selenium-webdriver'
require 'web-object/element'
require 'web-object/elements'

require 'web-object/conditions/alert'
require 'web-object/conditions/element_interaction'
require 'web-object/conditions/element_property'
require 'web-object/conditions/url'
require 'web-object/conditions/title'
require 'web-object/conditions/text'

include WebConditions


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