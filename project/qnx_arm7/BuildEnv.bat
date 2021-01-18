@echo on

pushd ..\..\..\..\OpenHMI\tool\BuildChain\qnx_Jacinto4_Yamaha_2DF\host\win32\x86
set QNX_HOST=%CD%
popd

pushd  ..\..\..\..\OpenHMI\tool\BuildChain\qnx_Jacinto4_Yamaha_2DF\target\qnx6
set QNX_TARGET=%CD%
popd

set PATH=%QNX_HOST%/usr/bin;%PATH%

rem Clean up the makefile include path
pushd "%QNX_TARGET%/usr/include"
set MAKEFLAGS=-I%CD:\=/%
popd

rem start "QNX Environment" /D%CD% cmd.exe
start /D%CD% cmd.exe