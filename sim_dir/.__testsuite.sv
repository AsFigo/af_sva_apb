module __testsuite;
  import svunit_pkg::svunit_testsuite;

  string name = "__ts";
  svunit_testsuite svunit_ts;
  
  
  //===================================
  // These are the unit tests that we
  // want included in this testsuite
  //===================================
  axi4_lite_unit_test axi4_lite_ut();


  //===================================
  // Build
  //===================================
  function void build();
    axi4_lite_ut.build();
    svunit_ts = new(name);
    svunit_ts.add_testcase(axi4_lite_ut.svunit_ut);
  endfunction


  //===================================
  // Run
  //===================================
  task run();
    svunit_ts.run();
    axi4_lite_ut.run();
    svunit_ts.report();
  endtask

endmodule
