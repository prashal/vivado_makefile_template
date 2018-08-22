# Make does not offer a recursive wildcard function, so here's one:
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

# How to recursively find all files with the same name in a given folder
VHDL := $(call rwildcard,source/,*.vhd)
VERILOG := $(call rwildcard,source/,*.v)
XDC := $(call rwildcard,source/,*.xdc)

SETUPDEPS =  $(VHDL) $(VERILOG) $(XDC)
SETUPOPS = -source script/setup.tcl -log log/setup.log -jou log/setup.jou

# Common Vivado options
VIVADOCOMOPS = -mode batch


# These are all the compilation targets, starting with "all"
all : setup compile sim

# This setups up the top level project
setup : .setup.done
.setup.done : $(SETUPDEPS)
	@mkdir -p project
	@mkdir -p log
	vivado $(VIVADOCOMOPS) $(SETUPOPS)

compile : .compile.done
.compile.done : log/.setup.done
	vivado $(VIVADOCOMOPS) -source script/compile.tcl -log log/compile.log -jou log/compile.jou

sim : .sim.done
.sim.done : log/.setup.done
	vivado $(VIVADOCOMOPS) -source script/sim.tcl -log log/sim.log -jou log/sim.jou

guisim : log/.setup.done
	vivado -source script/sim.tcl -log log/guisim.log -jou log/guisim.jou

# delete everything except this Makefile
.PHONY: clean
clean :	
	@echo "Removing the project and log files"
	@rm -rf project
	@rm -rf log
