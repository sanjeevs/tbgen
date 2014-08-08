class Output
  attr_accessor :messages
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

Given(/^I am not familiar with the tool$/) do
end

When(/^I invoke the tool$/) do
  tb  = Tbgen::Testbench.new(output)
  tb.start()
end

Then /^I should see "([^"]*)"$/ do |message|
  output.message.should include(message)
end
