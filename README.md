GCP infrastructure as a terraform code
======================================

At the beginning
----------------

# Install gcloud
curl https://sdk.cloud.google.com | bash
gcloud init

# create user and export key
gcloud iam service-accounts create terraform --display-name "Terraform admin account"
gcloud iam service-accounts list
gcloud iam service-accounts keys create ~/.config/gcloud/account-fejk-infra.json --iam-account terraform@PROJECT_NAME.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/account-fejk-infra.json 

# set permissions (minimal)
gcloud organizations add-iam-policy-binding PROJECT_CODE --member serviceAccount:terraform@PROJECT_NAME.gserviceaccount.com --role roles/resourcemanager.projectCreator
gcloud projects add-iam-policy-binding PROJECT_NAME --member serviceAccount:terraform@PROJECT_NAME.iam.gserviceaccount.com --role roles/editor
gcloud projects add-iam-policy-binding PROJECT_NAME --member serviceAccount:terraform@PROJECT_NAME.iam.gserviceaccount.com --role roles/storage.admin

# create bucket and start versioning
gsutil mb -p PROJECT_NAME gs://TFSTATE_BUCKET
gsutil -p PROJECT_NAME versioning set on gs://TFSTATE_BUCKET

# Install terraform
it depends on your OS

# Start with terraform
terraform init
terraform plan
terraform apply
...




How to contribute
-----------------
- project_name
   - main.tf        # include connections and backend for tfstate
   - vpc-name.tf    # configuration for vpc
   - dns-name.tf    # configuration for dns
   - $SVC-$NAME.tf  # please follow this scheme to keep it modular and readable




