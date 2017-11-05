module Alert
  class Alert < ApplicationRecord
    
      has_one :led, dependent: :destroy
      accepts_nested_attributes_for :led
    
      has_one :button, dependent: :destroy
      accepts_nested_attributes_for :button
    
  end
end