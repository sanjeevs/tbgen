Feature: Invoke help
  Scenario: First time user
    When I run `tbgen`
    Then it should fail with:
      """
      error: you must specify a dut top level file
      """

  Scenario: Invoke with -h option
    When I run `tbgen -h`
    Then it should pass with:
    """
    Welcome to Testbench Generator !
    """ 
