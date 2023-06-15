#!/usr/bin/env bash

set -e

WORKING_DIR=$(pwd)

cp ${WORKING_DIR}/variables.tf ${WORKING_DIR}/ocscluster/variables.tf
cp ${WORKING_DIR}/schematics.tfvars ${WORKING_DIR}/ocscluster/schematics.tfvars
cd ${WORKING_DIR}/ocscluster
terraform1.3 init
if [ -e ${WORKING_DIR}/ocscluster/terraform.tfstate ]
then
    echo "ok"
else
    terraform1.3 import -var-file=${WORKING_DIR}/ocscluster/schematics.tfvars kubernetes_manifest.ocscluster_ocscluster_auto "apiVersion=ocs.ibm.io/v1,kind=OcsCluster,namespace=openshift-storage,name=ocscluster-auto"
    terraform1.3 apply --auto-approve -var-file ${WORKING_DIR}/ibm_odf_addon/schematics.tfvars
fi

terraform1.3 destroy --auto-approve -var-file=${WORKING_DIR}/ocscluster/schematics.tfvars