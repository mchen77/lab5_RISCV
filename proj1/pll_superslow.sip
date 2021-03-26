set_global_assignment -entity "pll_superslow" -library "lib_pll_superslow" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "pll_superslow" -library "lib_pll_superslow" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "pll_superslow" -library "lib_pll_superslow" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_pll_superslow" -name SPD_FILE [file join $::quartus(sip_path) "pll_superslow.spd"]

set_global_assignment -library "lib_pll_superslow" -name MISC_FILE [file join $::quartus(sip_path) "pll_superslow_sim/pll_superslow.vo"]
