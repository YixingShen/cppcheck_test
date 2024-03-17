set PATH=%PATH%;D:\Cppcheck
set addon=--addon=misra/misra.json
::set addon=--addon=misra

cd cppchk
mkdir build-dir

cppcheck --verbose ^
--language=c --language=c++ ^
--std=c99 --std=c++11 ^
--enable=all ^
--disable=missingInclude ^
--library=gnu ^
--library=cfg/arm-cortex-m.cfg ^
--library=cfg/gnu.cppcheck.cfg ^
--library=cfg/armv8.1-m.main.cppcheck.cfg  ^
--library=cfg/gnu.cppcheck.cfg ^
--platform=platforms/arm32-wchar_t4 ^
--inconclusive ^
--inline-suppr ^
--suppress=missingIncludeSystem ^
--check-library --check-level=normal ^
--cppcheck-build-dir=build-dir ^
--showtime=none ^
%addon% ../MISRA-Example-Suite --xml 2> report.xml
::%addon% ../MISRA-Example-Suite --output-file=report.txt

python htmlreport/cppcheck-htmlreport --file=report.xml --report-dir=../output --source-dir=.

pause