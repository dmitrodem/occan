set target_library lsi_10k.db
set link_library lsi_10k.db

set files {
    can_defines.v
    can_register.v
    can_ibo.v
    can_fifo.v
    can_acf.v
    can_crc.v
    can_register_asyn.v
    can_register_asyn_syn.v
    can_bsp.v
    can_btl.v
    can_registers.v
    can_top.v
}
set srcs {}
foreach f $files {
    lappend srcs rtl/$f
}

file mkdir work
define_design_lib -path work work

foreach file $srcs {
    analyze -f verilog $file
}
elaborate can_top

create_clock -period 13.33 clk_i
set_input_delay -clock clk_i 0 [all_inputs]
set_output_delay -clock clk_i 0 [all_outputs]

set_drive 0 [all_inputs]
set_load 0 [all_outputs]

set_svf can_top.svf

compile_ultra -retime

write -hier -f ddc -o can_top.ddc
set_svf -off
exit
