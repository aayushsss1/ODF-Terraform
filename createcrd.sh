#!/bin/bash

set -e

WORKING_DIR=$(pwd)

cp ${WORKING_DIR}/variables.tf ${WORKING_DIR}/ocscluster/variables.tf
cp ${WORKING_DIR}/schematics.tfvars ${WORKING_DIR}/ocscluster/schematics.tfvars
cd ${WORKING_DIR}/ocscluster
terraform1.3 init
terraform1.3 apply --auto-approve -var-file ${WORKING_DIR}/ocscluster/schematics.tfvars