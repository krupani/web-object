# web-object  

Create page-object style test framework using original webdriver flavor.
Now what does original webdriver flavor is, it simply means, no additional wrappers, no additional syntax.
Hence just create page-objects and start using basic webdriver commands on it.

Moral of the story, elements created using web-object gem will be objects of WebElement class and one can perform all webdriver
commands on it like send_keys, click, displayed? .. and so on...

## Table of Contents
- [Installation](#install)  
    - [Install using gem command](#gem)    
    - [Install using bundler](#bundler)    
- [Syntax](#syntax)   
    - [Finding Element](#find_element)    
    - [Finding Multiple Elements](#find_elements)   
    - [Syntax Summary](#summary) 
- [Usage](#usage)   
- [Aliases](#alias)    
- [Contributing](#contributing)  
- [Issues](#issues)     
    

## <a name="install"></a> Installation :eyes:  
There are multiple ways in which you can install and use web-object gem.
You must have Ruby installed before you can install this gem.   

### <a name="gem" /> 1. Install using gem command
Just use following command from you Terminal.
``` 
gem install web-object 
```
   
### <a name="bundler" /> 2. Install using bundler    
You can include it in your Gemfile and run bundle install

``` 
gem 'web-object' 
```   
then run following   
```   
bundle install   
```   
  
  
    
## <a name="syntax"></a> Syntax :eyes:    
    
To use web-object, you need to extend your page class with web-object

### <a name="find_element"></a> 1. Finding Element   
Syntax   
element :name_of_element, {:locator_strategy => "locator value"}   
or   
find :name_of_element, {:locator_strategy => "locator value"}, error=false   
    
   
Eg:   
```   
element :login_email, {:id => "email"}   
element :login_password, {:css => "#pwd"}   
element :login_button, {:xpath => "//button[@id='signin']"}   
```      
or   
```   
find :login_email, {:id => "email"}   
find :login_password, {:css => "#pwd"}   
find :login_button, {:xpath => "//button[@id='signin']"}
```
   
Returns an object of WebElement.   
Raise an exception by default if element is not found.   
Will return Boolean false if error=false parameter is explicitly passed and element is not found.  

Eg of error handling as mentioned above:   
```   
1) element :login_button, {:id => 'signIn'}
2) element :profile_link, {:css => '.user_profile'}, error=false
   
# Example 1 will raise element not found exception if element not found on the page   
# Example 2 will just return a Boolean false if element not found on the page   

```

   

### <a name="find_elements"></a> 2. Finding Multiple Element   
Syntax   
elements :name_of_element, {:locator_strategy => "locator value"}   
or   
all :name_of_element, {:locator_strategy => "locator value"}, error=true   
or   
element_list :name_of_element, {:locator_strategy => "locator value"}

Eg:   
```   
elements :product_prices, {:id => "prices"}   
elements :active_users, {:css => ".users>#active"}, error=true    
```      
or   
```   
element_list :product_prices, {:id => "prices"}   
element_list :active_users, {:css => ".users>#active"}   
```   
or
```   
all :product_prices, {:id => "prices"}   
all :active_users, {:css => ".users>#active"}   
```   
  
Returns an array of WebElement objects.   
Return an empty array in element is not found by default.   
Will raise an error if error=true parameter explicitly passed and element is not found.   
  
  
Eg of error handling as mentioned above:   
```   
1) elements :names, {:id => 'names'}, error=true
2) elements :header_tabs, {:css => '.menu-item'}
   
# Example 1 will raise element not found exception if element not found on the page   
# Example 2 will just return an empty array if element not found on the page   

```
    
### <a name="summary"></a> 3. Syntax Summary : 
* error parameter is completely optional and web-object will continue to work as before.   
* Default behaviour will now match the same as webdriver.   
* __Finding single element will raise an exception by default if element not found on the page.__    
* __Finding multiple elements will return a blank array by default if element not found on the page.__   
* error parameter is used only to reverse the natural default behaviour.
* __Finding single element will return Boolean false if error paramter is sent as false and element not found on the page.__
* __Finding multiple elements will raise exception if error paramter is sent as true and element not found on the page.__
      
      
## <a name="usage"></a> Usage :eyes:   
Now as we saw how to create page objects, lets see how to put it to practical use.

```   
class Login < WebObject
  element :login_email, {:id => "email"}   
  element :login_password, {:css => "#pwd"}   
  element :login_button, {:xpath => "//button[@id='signin']"}   
  elements :active_users, {:css => ".users>#active"} 
  
  def login_to_portal(email,pwd)  
    login_email.send_keys(email)  
    login_pwd.send_keys(pwd)  
    login_button.click  
  end  
    
  def get_active_user_count   
    active_users.size
  end
end  
```   
  
## <a name="webconditions"></a> WebConditions :eyes: 
Always envied the fancy ExpectedConditions class which Java and Python has where they smoothly pass a condition within the WebDriver explicit wait object... And when it comes to Ruby, you need to go through a painfully lenghty procudere of creating your own method or fallback to other framweworks like Capybara or Watir loosing the original WebDriver flavor.   
  
Well, not to worry as web-object gem to the rescue.     
   
web-object gem is now equipped with an extensive list of WebConditions (we do not want to be called people who copied the name from Java so we call it WebConditions).  It can be used for both waiting for a particular condition inside the wait.until object and also in rspec assertions.   
   
   
How to use it then: here is how:    
```   
wait = Selenium::WebDriver::Wait.new(:timeout => 30)
wait.until{alert_present?}
```
or
```
wait = Selenium::WebDriver::Wait.new(:timeout => 30)    # Create wait object
wait.until{element_is_visible(element)}                 # Pass a condition with web element parameter 
wait.until{element_is_invisible(:id => 'some_button')}  # or just pass a condition with a locator hash

```  

Full list of WebConditions and [documentation](https://github.com/krupani/web-object/wiki) on how to use can be found [here](https://github.com/krupani/web-object/wiki).


## <a name="alias"></a> Aliases :eyes:   
There is an option to use PageObject class instead of WebObject.  
Eg:
``` class LoginPage < PageObject ```   
   
Also for elements as mentioned above   
for `element` there is an option to use `find` (for capybara flavor loving people)  
for `elements` there is an option to use `element_list` or `all`   

  
## <a name="contributing"></a> Contributing :eyes:
Ideas and suggestions are always always most welcome. Please fork this gem code and feel free to add any updates, suggestions etc and create a pull request.  

## <a name="issues"></a> Issues :eyes:
If you face any problem related to syntax, usability, documentation then please raise an [issues](https://github.com/krupani/web-object/issues)...   

