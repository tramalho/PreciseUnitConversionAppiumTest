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