set CPPCHECK_INSTALL_PATH=;D:\Cppcheck

set PATH=%PATH%;%CPPCHECK_INSTALL_PATH%

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
%addon% %1
