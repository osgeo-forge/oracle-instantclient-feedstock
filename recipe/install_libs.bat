if not exist %LIBRARY_BIN%\vc14 mkdir %LIBRARY_BIN%\vc14
if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if not exist %LIBRARY_INC%\oci mkdir %LIBRARY_INC%\oci

REM See: https://docs.oracle.com/en/database/oracle/oracle-database/12.2/lnoci/instant-client.html

REM Minimum:
REM   oci.dll           Forwarding functions that applications link with
REM   oraociei12.dll    Data and code
REM   orannzsbb12.dll   Security Library
REM   oraons.dll        ONS library used by OCI internally
REM   oci.sym
REM   oraociei12.sym
REM   orannzsbb12.sym

REM Binaries
xcopy oci.* %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy oraociei12.* %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy orannzsbb12.* %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy oraons.* %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy vc14\oraocci12.* %LIBRARY_BIN%\vc14\ /i
if errorlevel 1 exit 1

REM Headers and libs
xcopy sdk\include\*.h %LIBRARY_INC%\oci\ /i
if errorlevel 1 exit 1
xcopy sdk\lib\msvc\* %LIBRARY_LIB%\ /s /i
if errorlevel 1 exit 1
