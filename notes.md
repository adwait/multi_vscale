Notes:
- in binaries the instructions are big endian (other way around)
- cores start executing from PC = 4, 24, 44, 64 respectively
- each core gets 5 instructions

Instructions:

Quick test examples:
* addi:         `IMM	        xS : s1 	000 : ADDI	xD : dest	0010011 : ADDI`     
- 00200313:     002             00000       000         00110       0010011 : addi r6, r0, 2
- 00200293:     002             00000       000         00101       0010011 : addi r5, r0, 2
- 00100293:     001             00000       000         00101       0010011 : addi r5, r0, 1
- 00100313:     001             00000       000         00110       0010011 : addi r6, r0, 1
* load byte:    `OFFSET[11:0]	xB : base	000 : LB	xD : dest	0000011 : LOAD`
- 02000283:     020             00000       000         00101       0000011 : load mem r0(32) into r5
- 04000283:     040             00000       000         00101       0000011 : load mem r0(64) into r5
- 04100303:     041             00000       000         00110       0000011 : load mem r0(67) into r6
* store byte:   `OFFSET[11:5]	xS	    xB	    000 : SB	OFFSET	0100011 : STORE`
- 10500023:     0001000         00101   00000   000         00000   0100011 : store r5 into mem r0(256) 
- 046000A3:     0000010         00110   00000   000         00001   0100011 : store r6 into mem r0(65)
- 04500023:     0000010         00101   00000   000         00000   0100011 : store r5 into mem r0(64)



Yosys: verilog-firrtl utils:

### Converting from verilog to firrtl:

#### Write a yosys script:
- read_verilog filepath.v 
- hierarchy -top <topfile> // sets up hierarchy (optional)
- check hierarchy // optional (check also can take other arguments)
- proc; opt // convert to netlist and optimize previous pass
- memory; opt; fsm; opt (more passes: see http://www.clifford.at/yosys/documentation.html)
- write_firrtl filename.fir // emit firrtl code

#### Run yosys on script:
- yosys -f verilog -s gen_fir_script
