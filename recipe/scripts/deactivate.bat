@REM Restore previous env vars if they were set

@set "ORACLE_HOME="
@if defined _CONDA_SET_ORACLE_HOME (
  set "ORACLE_HOME=%_CONDA_SET_ORACLE_HOME%"
  set "_CONDA_SET_ORACLE_HOME="
)

@set "OCI_LIB="
@if defined _CONDA_SET_OCI_LIB (
  set "OCI_LIB=%_CONDA_SET_OCI_LIB%"
  set "_CONDA_SET_OCI_LIB="
)

@set "TNS_ADMIN="
@if defined _CONDA_SET_TNS_ADMIN (
  set "TNS_ADMIN=%_CONDA_SET_TNS_ADMIN%"
  set "_CONDA_SET_TNS_ADMIN="
)
