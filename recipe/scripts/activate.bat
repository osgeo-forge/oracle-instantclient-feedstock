@REM Store existing env vars and set to this conda env
@REM so other installs don't pollute the environment

@if defined ORACLE_HOME (
    set "_CONDA_SET_ORACLE_HOME=%ORACLE_HOME%"
)
@set "ORACLE_HOME=%CONDA_PREFIX%\Library"

@if defined OCI_LIB (
    set "_CONDA_SET_OCI_LIB=%OCI_LIB%"
)
@set "OCI_LIB=%CONDA_PREFIX%\Library\lib"

@if defined TNS_ADMIN (
    set "_CONDA_SET_TNS_ADMIN=%TNS_ADMIN%"
)
@set "TNS_ADMIN=%CONDA_PREFIX%\Library\network\admin"
