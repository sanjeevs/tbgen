Feature: Invoking the tool with no arguments

  As a designer
  I want to use the tool 
  So that I can generate a testbench

  Scenario: know about the tool 
    Given I am not familiar with the tool
    When I invoke the tool
    Then I should see "Welcome to Testbench Generator!"
    And I should see "Require the top level design verilog file"

