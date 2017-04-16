require 'selenium-webdriver'
require 'web-object/element'
require 'web-object/elements'

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