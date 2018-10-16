# Set connections
terraform {
    backend "gcs" {
        bucket      = "fejk-state"
        prefix      = "terraform"
        project     = "fejk-infra"
    }
}

# Store tfstate in GCP bucket
provider "google" {
    project     = "fejk-infra"
    region      = "europe-west3"
}
