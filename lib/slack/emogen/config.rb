require "yaml"

module Slack::Emogen
  class Config
    class << self
      def find_or_create!
        @@yml_path = File.join($root_path, "config.yml")
        opts =
          if File.exist?(@@yml_path)
            YAML::load_file @@yml_path
          else
            url, login, password = build_message
            setup(url, login, password)
          end
        new(opts)
      end

      def build_message
        puts <<-EOS

        enter your slack url
        ex) https://example.slack.com/

        EOS

        url = STDIN.gets.chop

        puts <<-EOS
        enter your slack login mail address
        ex) hogemoge@example.com
        EOS

        login = STDIN.gets.chop

        puts <<-EOS
        enter your slack password
        ex) doraemon
        EOS

        password = STDIN.gets.chop

        [url, login, password]
      end

      def setup(url, login, password)
        File.open(@@yml_path, "w") do |f|
          content = <<-EOS
            url: '#{url}'
            login: '#{login}'
            password: '#{password}'
          EOS
          f.write(content)
        end
        {url: url, login: login, password: password}
      end
    end

    attr_reader :url, :login, :password

    def initialize(opts)
      _opts = opts.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
      @url = _opts.fetch(:url)
      @login = _opts.fetch(:login)
      @password = _opts.fetch(:password)
    end
  end
end
