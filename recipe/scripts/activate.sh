#!/bin/bash

# Store existing env vars and set to this conda env
# so other installs don't pollute the environment

# Windows has ${CONDA_PREFIX}/Library
c_prefix=${CONDA_PREFIX}
if [ -d ${CONDA_PREFIX}/Library ]; then
  c_prefix=${CONDA_PREFIX}/Library
fi

if [[ -n "${ORACLE_HOME}" ]]; then
  export _CONDA_SET_ORACLE_HOME=${ORACLE_HOME}
fi
export ORACLE_HOME="${c_prefix}"

if [[ -n "${OCI_LIB}" ]]; then
  export _CONDA_SET_OCI_LIB=${OCI_LIB}
fi
export OCI_LIB="${c_prefix}/lib"

if [[ -n "${TNS_ADMIN}" ]]; then
  export _CONDA_SET_TNS_ADMIN=${TNS_ADMIN}
fi
export TNS_ADMIN="${c_prefix}/network/admin"
