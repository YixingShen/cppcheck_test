set CPPCHECK_INSTALL_PATH=;D:\Cppcheck

set BUILD_DIR=cppchk-build-dir
set REPORT_DIR=cppchk-report-dir
set PATH=%PATH%;%CPPCHECK_INSTALL_PATH%

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

set addon=--addon=cppchk/misra/misra.json
::set addon=--addon=misra

cppcheck --verbose ^
--language=c --language=c++ ^
--std=c99 --std=c++11 ^
--enable=all ^
--disable=missingInclude ^
--library=gnu ^
--library=cppchk/cfg/arm-cortex-m.cfg ^
--library=cppchk/cfg/gnu.cppcheck.cfg ^
--library=cppchk/cfg/armv8.1-m.main.cppcheck.cfg  ^
--library=cppchk/cfg/gnu.cppcheck.cfg ^
--platform=cppchk/platforms/arm32-wchar_t4 ^
--inconclusive ^
--inline-suppr ^
--suppress=missingIncludeSystem ^
--check-library --check-level=normal ^
--showtime=none ^
--cppcheck-build-dir=%BUILD_DIR% ^
%addon% ./MISRA-Example-Suite --xml 2> report.xml
::%addon% ./MISRA-Example-Suite --output-file=report.txt

python cppchk/htmlreport/cppcheck-htmlreport --file=report.xml --report-dir=%REPORT_DIR% --source-dir=.

pause