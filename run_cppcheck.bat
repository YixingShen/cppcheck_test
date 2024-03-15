set PATH=%PATH%;D:\Cppcheck

set addon=--addon=misra.json
::set addon=--addon=misra

mkdir build-dir

cppcheck --enable=all --std=c99 --std=c++11 ^
--library=arm-cortex-m.cfg --platform=arm32-wchar_t4.xml ^
--suppress=missingIncludeSystem ^
--cppcheck-build-dir=build-dir ^
%addon% ./MISRA-Example-Suite --xml 2> report.xml

python htmlreport/cppcheck-htmlreport --file=report.xml --report-dir=output --source-dir=.

pause