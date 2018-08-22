# Vivado Makefile Template

### Xilinx Vivado Empty Makefile Project template



### Project Configure :

1. Update config.tcl file with proper project parametes

2. Import synthesizable sources (VHDL or verilog file) into source\synthesis directory

3. Import testbench sources (VHDL or verilog file) into source\simulation directory

4. Import constraint source (xdc file) into source\constraint directory



### Prerequisite :

1. Computer may have Linux or Windows. However for linux Msys2 must be installed

2. GNU make utility should be installed



### Compile :

1. For windows, update env.bat file with proper Vivado version and msys2 path

2. Open terminal in the project root directory

3. If windows, run 'env' to import the  vivado environment settings.

4. Project is ready. Now you can run any of the following commands
```shell
make setup
make compile
make sim
make guisim
make all
make clean
```

-Prasanta Halder
