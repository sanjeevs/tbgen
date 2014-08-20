module my_input1(
  a,
  b);
  reg  a;
  reg  b;

  task send(my_input1_xact xact);
    a = xact.a;
    b = xact.b;
  endtask

endmodule
...........F

Failures:

  1) Tbgen::Testbench should have render hdl testbench
     Failure/Error: tb = Testbench.render_hdl_testbench
     SyntaxError:
       (erb):2: syntax error, unexpected keyword_do_block
       ;  @dut.ports.each do |port| do ; _erbout.concat "\n  "
                                      ^
       (erb):8: syntax error, unexpected keyword_do_block
       ;  @protocols.each do |protocol| do ; _erbout.concat "\n  "
                                          ^
       (erb):18: syntax error, unexpected end-of-input, expecting keyword_end
       ; _erbout.force_encoding(__ENCODING__)
                                             ^
     # ./lib/tbgen/testbench.rb:11:in `block in render_hdl_testbench'
     # ./lib/tbgen/testbench.rb:10:in `open'
     # ./lib/tbgen/testbench.rb:10:in `render_hdl_testbench'
     # ./spec/tbgen/tbgen_spec.rb:27:in `block (2 levels) in <module:Tbgen>'

Finished in 0.01288 seconds (files took 0.16494 seconds to load)
12 examples, 1 failure

Failed examples:

rspec ./spec/tbgen/tbgen_spec.rb:26 # Tbgen::Testbench should have render hdl testbench
