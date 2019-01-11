
if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%

mkdir %LIBRARY_PREFIX%\doc\oci_help
REM Make any extra client paths
mkdir %LIBRARY_PREFIX%\sqlplus\admin
mkdir %LIBRARY_PREFIX%\network\admin

REM Remove items already in libs pkg
del /F /Q oci.*
if errorlevel 1 exit 1
del /F /Q oraociei12.*
if errorlevel 1 exit 1
del /F /Q orannzsbb12.*
if errorlevel 1 exit 1
del /F /Q oraons.*
if errorlevel 1 exit 1

rd /S /Q vc14
if errorlevel 1 exit 1
rd /S /Q sdk
if errorlevel 1 exit 1

REM Binaries, but skip JAVA
xcopy *.exe %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy *.dll %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1
xcopy *.sym %LIBRARY_BIN%\ /i
if errorlevel 1 exit 1

REM SQLPlus site profile
copy glogin.sql %LIBRARY_PREFIX%\sqlplus\admin\
if errorlevel 1 exit 1

REM ODBC Help
copy ODBC_IC_Readme_Win.html %LIBRARY_PREFIX%\doc\oci_help\
if errorlevel 1 exit 1
xcopy help\* %LIBRARY_PREFIX%\doc\oci_help\ /s /i
if errorlevel 1 exit 1

REM Create network connection placeholder file
set "tnsnames=%LIBRARY_PREFIX%\network\admin\tnsnames.ora"
echo "# https://www.oracle.com/technetwork/database/features/oci/ic-faq-094177.html#A4428" > %tnsnames%
echo "# https://docs.oracle.com/database/121/NETRF/tnsnames.htm#NETRF007" >> %tnsnames%
echo "# https://docs.oracle.com/cd/A57673_01/DOC/net/doc/NWUS233/apb.htm" >> %tnsnames%
if errorlevel 1 exit 1


REM Set up env (de)activation
set ACTIVATE_DIR=%PREFIX%\etc\conda\activate.d
set DEACTIVATE_DIR=%PREFIX%\etc\conda\deactivate.d
mkdir %ACTIVATE_DIR%
mkdir %DEACTIVATE_DIR%

copy %RECIPE_DIR%\scripts\activate.bat %ACTIVATE_DIR%\oracle-instantclient-activate.bat
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.bat %DEACTIVATE_DIR%\oracle-instantclient-deactivate.bat
if errorlevel 1 exit 1

:: Copy unix shell activation scripts, needed by Windows Bash users
copy %RECIPE_DIR%\scripts\activate.sh %ACTIVATE_DIR%\oracle-instantclient-activate.sh
if errorlevel 1 exit 1

copy %RECIPE_DIR%\scripts\deactivate.sh %DEACTIVATE_DIR%\oracle-instantclient-deactivate.sh
if errorlevel 1 exit 1
