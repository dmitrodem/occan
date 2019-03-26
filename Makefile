all: dc fm

dc:
	dc_shell -f dc.tcl

fm:
	fm_shell -f fm.tcl

clean:
	-rm -rf \
	alib-52 can_top.ddc can_top.svf command.log default.svf \
	fm_shell_command.log formality.log formality_svf work

.PHONY: dc fm all clean
