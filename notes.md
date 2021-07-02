Notes:
- in binaries the instructions are big endian (other way around)
- cores start executing from PC = 4, 24, 44, 64 respectively
- each core gets 5 instructions

Instructions:

* load byte: `OFFSET[11:0]	xB : base	000 : LB	xD : dest	0000011 : LOAD`
* store byte: `OFFSET[11:5]	xS	xB	000 : SB	OFFSET	0100011 : STORE`

Quick test examples:
- 02000283: load mem 0(32) into r5
- 10500023: store r5 into mem 0(32) 