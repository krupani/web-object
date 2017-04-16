module Elements

  def self.included(base)
    base.extend FindElements
  end

  module FindElements

    # @method element(element_name, locator, error=true)
    # @param element_name [:Symbol]
    # @param locator [Hash]
    # @param error [Boolean] - default false
    # @return [Selenium::WebDriver::Element]
    # @return [empty Array] -- if element not found and error parameter = false

    def elements(element_name, locator, error=false)
      send(:define_method, element_name) do
        wait = Selenium::WebDriver::Wait.new(:timeout => 0.5)
        begin
          wait.until { !@driver.find_elements(locator).empty? }
          @driver.find_elements(locator)
        rescue Selenium::WebDriver::Error::TimeOutError
          if error
            raise "Could not find any elements using '#{locator.first.key}=#{locator.first.key}' strategy"
          else
            return []
          end
        end
      end
    end

  end

end