Feature: Default Feature
  Scenario: Run with default testbench
    Given a file named "dut.v" with: 
    """
      module dut(clk, rst, in1, out1);
        input clk;
        input rst;
        input in1;
        output out1;
      endmodule
    """
    When I run `tbgen dut.v`
    Then the following files should exist:
      | testbench.sv |
      | xact.sv      |
      | base_test.sv |


