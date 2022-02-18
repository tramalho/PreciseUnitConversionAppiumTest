require 'appium_lib'

def caps
  {
    caps: {
      deviceName: "Pixel_2_API_24",
      platformName: "Android",
      #platformVersion: "14.6",
      app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
      appPackage: "com.ba.universalconverter",
      appActivity: "MainConverterActivity"
    },
    appium_lib: {
      server_url: 'http://127.0.0.1:4723/wd/hub',
      wait: 60
    }
  }
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

def wait_and_send_keys(id, value)
  element = find_with_wait(id)
  element.send_keys(value)
end

def wait_and_click(id)
  element = find_with_wait(id)
  element.click
end

private def newWait
  Selenium::WebDriver::Wait.new(:timeout => 5)
end

def wait_and_find_text_by_x_path(text)
  wait = newWait()
  wait.until { find_element(xpath: "//android.widget.TextView[contains(@text,'#{text}')]") }
end

def wait_and_find_text_by_id_and_x_path(id, text)
  wait = newWait
  id_element = find_with_wait(id)
  wait.until { id_element.find_element(xpath: "//android.widget.TextView[contains(@text,'#{text}')]").displayed? }
end

def validate_selected_in_spinner(id, expected_value, searched_index)
  text_element = find_with_wait_elements(id)

  if text_element[searched_index].text != expected_value
    fail("Expected #{expected_value} returned: #{text_element}")
  end
end

def find_with_wait(id)
  find_with_wait_elements(id)[0]
end

private def find_with_wait_elements(id)
  wait = newWait
  wait.until { find_elements(id: id) }
end