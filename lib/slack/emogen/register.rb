require "uri"
require "selenium-webdriver"
require "headless"

module Slack::Emogen
  class Register

    def initialize(config, img_path, key)
      @config = config
      @img_path = img_path
      @emoji_name = key
      @driver = Selenium::WebDriver.for :firefox
    end

    def post!
      login
      input_values
    rescue => e
      @driver.quit
    end

    def login
      @driver.navigate.to emoji_custome_url
      sleep 1
      email = @driver.find_element(:id, :email)
      password = @driver.find_element(:id, :password)

      email.send_keys(@config.login)
      password.send_keys(@config.password)

      @driver.find_element(:id, :signin_btn).click
    end

    def input_values
      emoji_name = @driver.find_element(:id, "emojiname")
      emoji_name.send_keys(@emoji_name)

      emoji_img = @driver.find_element(:id, :emojiimg)
      emoji_img.send_keys @img_path

      submit_btn = @driver.find_element(:css, ".btn.btn_primary")
      submit_btn.click

      @driver.quit
    end

    def emoji_custome_url
      URI.join(@config.url, "customize/emoji").to_s
    end


  end
end
