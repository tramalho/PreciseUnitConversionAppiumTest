require "appium_lib"

def caps
  {
    caps: {
      deviceName: "Pixel_2_API_24",
      platformName: "Android",
      #platformVersion: "14.6",
      app: (File.join(File.dirname(__FILE__ ), "PreciseUnitConversion.apk")),
      appPackage: "com.ba.universalconverter",
      appActivity: "MainConverterActivity"
    }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

def wait_and_send_keys(id, value)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { find_element(id: id).displayed? }
  find_element(id: id).send_keys(value)
end

def wait_and_click(id)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { find_element(id: id).displayed? }
  find_element(id: id).click
end

def find_text_by_x_path(text)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until { find_element(xpath: "//android.widget.TextView[contains(@text,'#{text}')]").displayed? }
end