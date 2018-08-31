require_relative '../etyl.rb'

java_import 'com.harium.etyl.Etyl'
java_import 'com.harium.etyl.layer.ImageLayer'
java_import 'com.harium.etyl.commons.context.Application'
java_import 'com.harium.etyl.commons.event.KeyEvent'

class Main < Etyl
  field_accessor :w, :h

  def initialize
    super 960, 480
    set_title "Hello Etyl with Keyboard"
  end

  def startApplication
    ImageSampleApplication.new w, h
  end

  class ImageSampleApplication < Application
    def load
      @layer = ImageLayer.new 200, 80, "logo.png"
      @speed = 10
    end

    def draw g
      @layer.draw g
    end

    def update now
      if @right_key
        @layer.offset_x @speed
      end
      if @left_key
        @layer.offset_x -@speed
      end
      if @up_key
        @layer.offset_y -@speed
      end
      if @down_key
        @layer.offset_y @speed
      end
    end

    def updateKeyboard event
      if(event.is_key_down KeyEvent::VK_RIGHT_ARROW)
        @right_key = true
      elsif(event.is_key_up KeyEvent::VK_RIGHT_ARROW)
        @right_key = false
      end

      if(event.is_key_down KeyEvent::VK_LEFT_ARROW)
        @left_key = true
      elsif(event.is_key_up KeyEvent::VK_LEFT_ARROW)
        @left_key = false
      end

      if(event.is_key_down KeyEvent::VK_UP_ARROW)
        @up_key = true
      elsif(event.is_key_up KeyEvent::VK_UP_ARROW)
        @up_key = false
      end

      if(event.is_key_down KeyEvent::VK_DOWN_ARROW)
        @down_key = true
      elsif(event.is_key_up KeyEvent::VK_DOWN_ARROW)
        @down_key = false
      end
    end
  end
end

# Starting Main
opening = Main.new
opening.init
