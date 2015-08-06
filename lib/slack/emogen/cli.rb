require "thor"
require "slack/emogen/image"
require "slack/emogen/config"
require "slack/emogen/register"

module Slack::Emogen
  class CLI < Thor

    desc "emogen", "add post to slack, image will convert emoji, key will emoname"
    option :image, aliases: "i", required: true
    option :key, aliases: "k", required: true
    def do_run
      config = Slack::Emogen::Config.find_or_create!
      image_path = File.expand_path(options[:image])
      emoji_image = Slack::Emogen::Image.resize image_path
      Slack::Emogen::Register.new(config, emoji_image, options[:key]).post!
    end
    default_task :do_run
  end
end
