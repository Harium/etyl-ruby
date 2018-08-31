require_relative '../etyl.rb'

java_import 'com.harium.etyl.Etyl'
java_import 'com.harium.etyl.layer.ImageLayer'
java_import 'com.harium.etyl.commons.context.Application'

class Main < Etyl
  field_accessor :w, :h

  def initialize
    super 960, 480
    set_title "Hello Etyl with Image"
  end

  def startApplication
    ImageSampleApplication.new w, h
  end

  class ImageSampleApplication < Application
    def load
      @layer = ImageLayer.new "logo.png"
      @layer.centralize self
    end

    def draw g
      @layer.draw g
    end
  end
end

# Starting Main
opening = Main.new
opening.init
