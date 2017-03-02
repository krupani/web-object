#web-object  

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
- [Usage](#usage)   
- [Aliases](#alias)    
- [Contributing](#contributing)  
- [Issues](#issues)     
    

## <a name="install"></a> Installation :eyes:  
There are multiple ways in which you can install and use testnow gem.
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
element(:<name_of_element>, :<locator_strategy> => "locator value")   
or   
find :<name_of_element>, {:<locator_strategy> => "locator value"}   

Returns an object of WebElement

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
   

### <a name="find_elements"></a> 2. Finding Multiple Element   
Syntax   
elementd(:<name_of_element>, :<locator_strategy> => "locator value")   
or   
all :<name_of_element>, {:<locator_strategy> => "locator value"}   
or   
element_list :<name_of_element>, {:<locator_strategy> => "locator value"}

Returns an array of WebElement objects

Eg:   
```   
elements :product_prices, {:id => "prices"}   
elements :active_users, {:css => ".users>#active"}   
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
  
__Note: Currently finding multiple elements will raise an exception if no element is found. 
In subsequent version, there will be an option to get back an empty array if no element is found.__  
  
    
      
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

