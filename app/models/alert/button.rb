module Alert
  class Button < ApplicationRecord
    # The method(s) that correspond to device interfaces are: safe 
    
    has_many :button_safe_logs, dependent: :destroy
    belongs_to :alert
    attr_accessor :skip_extract
    after_commit :extract, unless: :skip_extract
    after_commit :channel_push
    before_save :update_led
    # after_commit :sync_all_leds
    
    def sync
      Apiotics.sync(self)
    end

    def update_led
      byebug
      if self.safe == true
        self.alert.led.led_state = false
      else
        self.alert.led.led_state = true
      end
      self.alert.led.save
    end
    
    private

    # def sync_all_leds
    #   ledState = self.alert.led.led_state
    #   byebug
    #   ObjectSpace.each_object(Alert) {|a| 
    #     if a != self.alert
    #       a.led.led_state = self.alert.led.led_state
    #       a.led.save
    #     end }
    # end


    def extract
      Apiotics::Extract.send(self)
    end
    
    def channel_push
      if Apiotics.configuration.push == true
        interfaces = Hash.new
        puts self.previous_changes
        self.previous_changes.each do |k,v|
          if Apiotics::Extract.is_target(self, k)
            interfaces[k] = v[1].to_s
          end
        end
        interfaces.each do |k,v|
          ActionCable.server.broadcast "#{self.class.parent.to_s.underscore.downcase.gsub(" ", "_")}_channel",
            apiotics_instance: self.alert.apiotics_instance,
            worker_name: self.class.parent.to_s.underscore.downcase.gsub(" ", "_"),
            model_name: self.class.name.demodulize.to_s.underscore.downcase.gsub(" ", "_"),
            interface: k,
            value: v
        end
      end
    end
  
  end
end