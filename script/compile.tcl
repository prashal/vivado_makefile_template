# get the directory where this script resides
set thisDir [file dirname [info script]]
# source common utilities
source -notrace $thisDir/utils.tcl


# these variables point to the root directory location
# of various source types - change this to point to 
# any directory location accessible to the machine
set repoRoot [pwd]
set workRoot $repoRoot/project
set hdlRoot $repoRoot/source/synthesis
set tbRoot $repoRoot/source/simulation
set xdcRoot $repoRoot/source/constraint


# Loading the project settings
source $repoRoot/config.tcl

# Open project
open_project $workRoot/${project_name}.xpr

#launch_runs impl_1 -to_step write_bitstream
launch_runs impl_1 
wait_on_run impl_1
open_run impl_1

write_bitstream $workRoot/${project_name}.bit
write_hwdef -file $workRoot/${project_name}.hwdef
write_sysdef -bitfile $workRoot/${project_name}.bit -hwdef $workRoot/${project_name}.hwdef -file $workRoot/${project_name}.sysdef

# if everything is successful "touch" a file so make will not it's done
touch {log/.compile.done}
