require 'simple_form'
Apiotics.configure do |config|
  config.targets = {"Alert"=>{"Led"=>["led_state"], "Button"=>["safe"]}}
end