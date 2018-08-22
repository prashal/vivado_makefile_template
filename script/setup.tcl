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

# Create project
create_project -force $project_name $workRoot/ -part $part_number

# Set project properties
set obj [get_projects $project_name]
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "Verilog" $obj


add_files -fileset sources_1 $hdlRoot
add_files -fileset sources_1 $xdcRoot
update_compile_order -fileset sources_1
set_property top $synth_top [get_filesets sources_1]

add_files -fileset sim_1 $hdlRoot
add_files -fileset sim_1 $tbRoot
update_compile_order -fileset sim_1
set_property top $sim_top [get_filesets sim_1]

# If successful, "touch" a file so the make utility will know it's done 
touch {log/.setup.done}
