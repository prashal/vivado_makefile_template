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

# This script launches Vivado Simulator
launch_simulation
# For third party simulators, you can set it up to generate do file scripts
#set_property target_simulator questa [current_project] 
#launch_simulation -scripts_only
#

# if everything is successful "touch" a file so make will not it's done
touch {log/.sim.done}
