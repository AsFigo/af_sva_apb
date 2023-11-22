vlt: clean apb 

gls: clean
	runSVUnit -s vlt -c -I../go2uvm/go2uvm/src/ -f gls.flist -t ../src/APB_CIP_src/af_apb_tests.sv -c -I../src/APB_CIP_src/ -c "--assert --trace " 2>&1 | tee apb_cip_run_vlt.log

apb: clean
	runSVUnit -s vlt -c -I../go2uvm/go2uvm/src/ -f flist -t ../src/APB_CIP_src/af_apb_tests.sv -c -I../src/APB_CIP_src/ -c "--assert --trace " 2>&1 | tee apb_cip_run_vlt.log

ahb: clean
	runSVUnit -s vlt -c -I../go2uvm/go2uvm/src/ -f flist -t ../src/AHB_CIP_src/af_ahb_tests.sv -c -I../src/AHB_CIP_src/ -c "--assert --trace " 2>&1 | tee ahb_cip_run_vlt.log

axi: clean
	runSVUnit -s vlt -c -I../go2uvm/go2uvm/src/ -f flist -t ../src/AXI/axi4_lite/af_axi_tests.sv -c -I../src/AXI/axi4_lite/ -c "--assert --trace " 2>&1 | tee axi_cip_run_vlt.log

clean:
	rm -fr vbu* *.log obj* .sv* .*.sv *.vcd *.cfg
