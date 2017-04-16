module Element

  def self.included(base)
    base.extend FindElement
  end

  module FindElement

    # @method element(element_name, locator, error=true)
    # @param element_name [:Symbol]
    # @param locator [Hash]
    # @param error [Boolean] -- default true
    # @return [Selenium::WebDriver::Element]
    # @return [Boolean false] -- if element not found and error parameter = false

    def element(element_name, locator, error=true)
      send(:define_method, element_name) do
        wait = Selenium::WebDriver::Wait.new(:timeout => 0.5)
        begin
          wait.until { @driver.find_element(locator) }
        rescue Selenium::WebDriver::Error::TimeOutError
          if error
            raise "Could not find element using '#{locator.first.key}=#{locator.first.key}' strategy"
          else
            return false
          end
        end
      end
    end


  end

end