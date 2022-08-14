Before do
  $driver.start_driver
end

After do |scenario|

  if scenario.failed?
    if !File.directory?(EnvUtils::SCREENSHOTS_DIR)
      FileUtils.mkdir_p(EnvUtils::SCREENSHOTS_DIR)
    end

    # use datetime to have unique screenshots name
    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = "#{time_stamp}-#{scenario.name}.png"
    screenshot_file = File.join(EnvUtils::SCREENSHOTS_DIR, screenshot_name)
    $driver.screenshot(screenshot_file)

  end

  # quit driver before every scenario
  sleep 3
  $driver.driver_quit
end

AfterConfiguration do
  if File.directory? EnvUtils::SCREENSHOTS_DIR
    FileUtils.rm_r(EnvUtils::SCREENSHOTS_DIR)
  end
end