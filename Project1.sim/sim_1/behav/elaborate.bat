@echo off
set xv_path=C:\\Xilinx2\\Vivado\\2017.2\\bin
call %xv_path%/xelab  -wto acd1b576b36d4b7d8f2fc97af44edc34 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot counter_tb_behav xil_defaultlib.counter_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
