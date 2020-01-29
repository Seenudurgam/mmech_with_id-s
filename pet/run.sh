#! /bin/bash

# -- hello! -- 

# ---- validate variables ----

if [[ -z "${GREETING}" ]]
then
  echo "ERROR GREETING variable not defined."
  exit 1
fi

# --- go to stage ----

# debug
ls -la

# ---- terraform variables ----

export TF_VAR_greeting=${GREETING}
# TODO: add more

# ---- install terrafomr ----

export TF_VERSION=0.12.8
curl -LO https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
unzip terraform_${TF_VERSION}_linux_amd64.zip -d .
rm -f terraform_${TF_VERSION}_linux_amd64.zip
chmod +x terraform

# ---- init terraform ----

./terraform --version
./terraform init -no-color

if [[ $? -ne 0 ]]
then
  echo "ERROR Terraform init failed."
  exit 4
fi

# ---- plan terraform ----

./terraform plan -no-color
if [[ $? -ne 0 ]]
then
  echo "ERROR Terraform paln failed."
  exit 5
fi

# ---- apply terraform ----

./terraform apply -auto-approve -no-color
if [[ $? -ne 0 ]]
then
  echo "ERROR Terraform apply failed."
  exit 6
fi
