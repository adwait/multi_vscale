#!/bin/bash

sim/Vvscale_verilator_top +max-cycles=100 +loadmem=$1 --vcdfile=$2 && [ $PIPESTATUS -eq 0 ]

sed -i 's/timescale 1s/timescale 50ns/g' $2