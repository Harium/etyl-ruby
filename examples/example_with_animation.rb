require_relative '../etyl.rb'

java_import 'com.harium.etyl.Etyl'
java_import 'com.harium.etyl.layer.ImageLayer'
java_import 'com.harium.etyl.commons.context.Application'
java_import 'com.harium.etyl.core.animation.Animation'

class Main < Etyl
  field_accessor :w, :h

  def initialize
    super 960, 480
    set_title "Hello Etyl with Animation"
  end

  def startApplication
    SampleApplication.new w, h
  end

  class SampleApplication < Application
    def load
      @layer = ImageLayer.new 40, 40, "logo.png"
      Animation.animate(@layer).move_x(2000).from(0).to(200).start
    end

    def draw g
      @layer.draw g
    end
  end
end

# Starting Main
opening = Main.new
opening.init
