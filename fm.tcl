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

set_svf can_top.svf
suppress_message FMR_ELAB-147
read_verilog -container r -libname WORK -05 $srcs
set_top r:/WORK/can_top
read_ddc -container i can_top.ddc
read_db lsi_10k.db
set_top i:/WORK/can_top
verify
exit
