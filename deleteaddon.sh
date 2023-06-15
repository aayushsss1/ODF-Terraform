#!/usr/bin/env bash

set -e

WORKING_DIR=$(pwd)

cp ${WORKING_DIR}/variables.tf ${WORKING_DIR}/ibm_odf_addon/schematics.tfvars
cp ${WORKING_DIR}/schematics.tfvars ${WORKING_DIR}/ibm_odf_addon/schematics.tfvars
cd ${WORKING_DIR}/ibm_odf_addon
terraform1.3 init
if [ -e ${WORKING_DIR}/ibm_odf_addon/terraform.tfstate ]
then
    echo "ok"
else
   terraform1.3 apply --auto-approve -var-file=${WORKING_DIR}/ibm_odf_addon/schematics.tfvars
fi
terraform1.3 destroy --auto-approve -var-file=${WORKING_DIR}/ibm_odf_addon/schematics.tfvars