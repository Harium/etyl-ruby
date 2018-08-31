require_relative '../etyl.rb'

java_import 'com.harium.etyl.Etyl'
java_import 'com.harium.etyl.layer.ImageLayer'
java_import 'com.harium.etyl.commons.context.Application'
java_import 'com.harium.etyl.commons.event.KeyEvent'

class Main < Etyl
  field_accessor :w, :h

  def initialize
    super 960, 480
    set_title "Hello Etyl with Mouse"
  end

  def startApplication
    SampleApplication.new w, h
  end

  class SampleApplication < Application
    def load
      @layer = ImageLayer.new 200, 80, "logo.png"
    end

    def draw g
      @layer.draw g
    end

    def updateMouse event
      @layer.set_location event.x, event.y
    end
  end
end

# Starting Main
opening = Main.new
opening.init
