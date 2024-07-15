RSpec::Matchers.define :have_js_errors do
  failure_message_when_negated do
    %(Found JS errors:\n  #{@errors.join("\n  ")})
  end

  match do
    logs = page.driver.browser.logs.get(:browser)
    @errors = logs.select { |log| log.level == "SEVERE" }
    @errors.count > 0
  end
end
