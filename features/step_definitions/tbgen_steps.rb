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

When(/^I run `tbgen`$/) 
Then it should pass with:
  """
  Welcome to Testbench Generator!
  """
