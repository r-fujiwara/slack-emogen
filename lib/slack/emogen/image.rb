require "mini_magick"

module Slack::Emogen
  module Image
    extend self

    def resize(path)
      fail unless File.exist?(path)
      image = MiniMagick::Image.open(path)
      image.resize "128x128"
      image.path
    end
  end
end
