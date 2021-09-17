ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require "spec_helper"
require "rspec/rails"
# Add additional requires below this line. Rails is not loaded until this point!
require "capybara/rspec"


# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# Seting capybara for google chrome browser

selenium_host = "http://selenium-hub:4444/wd/hub"

unless ENV['SELENIUM_HOST'].nil?
  selenium_host = "http://#{ ENV["SELENIUM_HOST"] }:4444/wd/hub"
end

Capybara.register_driver :selenium_chrome do |app|
  # Capybara::Selenium::Driver.new(app, browser: :chrome)
  options = Selenium::WebDriver::Chrome::Options.new(args: %w[
    headless no-sandbox disable-gpu window-size=1920x1080
  ])
  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    desired_capabilities: :chrome,
    options: options,
    url: selenium_host
  )
end

Capybara.server = :puma, { Silent: true }
Capybara.javascript_driver = :selenium_chrome
Capybara.save_path = "#{ Rails.root }/tmp/screenshots/"
Capybara.asset_host = 'http://localhost:3000'
Capybara.run_server = true
Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  # accept clicking of associated label for checkboxes/radio buttons (css psuedo elements)
  config.automatic_label_click = true
end
Capybara.always_include_port = true

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation
  end

  # This block must be here, do not combine with the other `before(:each)` block.
  # This makes it so Capybara can see the database.
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
