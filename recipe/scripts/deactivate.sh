#!/bin/bash
# Restore previous env vars if they were set

unset ORACLE_HOME
if [[ -n "$_CONDA_SET_ORACLE_HOME" ]]; then
    export ORACLE_HOME=$_CONDA_SET_ORACLE_HOME
    unset _CONDA_SET_ORACLE_HOME
fi

unset OCI_LIB
if [[ -n "$_CONDA_SET_OCI_LIB" ]]; then
    export OCI_LIB=$_CONDA_SET_OCI_LIB
    unset _CONDA_SET_OCI_LIB
fi

unset TNS_ADMIN
if [[ -n "$_CONDA_SET_TNS_ADMIN" ]]; then
    export TNS_ADMIN=$_CONDA_SET_TNS_ADMIN
    unset _CONDA_SET_TNS_ADMIN
fi
