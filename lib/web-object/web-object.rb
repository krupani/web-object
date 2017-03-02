class WebObject

  def initialize(driver)
    @driver = driver
  end

  def self.element(element_name, locator)
    send(:define_method, element_name) do
      wait = Selenium::WebDriver::Wait.new(:timeout => 0.5)
      begin
        wait.until { @driver.find_element(locator) }
      rescue Selenium::WebDriver::Error::TimeOutError
        raise "Could not find element using '#{locator.first.key}=#{locator.first.key}' strategy"
      end
    end
  end

  singleton_class.send(:alias_method, :find, :element)

  def self.elements(element_name, locator)
    send(:define_method, element_name) do
      wait = Selenium::WebDriver::Wait.new(:timeout => 0.5)
      begin
        wait.until { !@driver.find_elements(locator).empty? }
        @driver.find_elements(locator)
      rescue Selenium::WebDriver::Error::TimeOutError
        raise "Could not find any elements using '#{locator.first.key}=#{locator.first.key}' strategy"
      end
    end
  end

  singleton_class.send(:alias_method, :element_list, :elements)
  singleton_class.send(:alias_method, :all, :elements)

end

PageObject = WebObject

