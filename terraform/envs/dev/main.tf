provider "google" {
  project = "silent-octagon-460701-a0"
  region  = "us-central1"
}

# Artifact Registry to store Docker images
resource "google_artifact_registry_repository" "devdocker" {
  project       = var.project_id
  location      = var.region
  repository_id = "docker-${var.env}"
  format        = "DOCKER"
}



# Cloud SQL instance for the orders database
resource "google_sql_database_instance" "db_instance_dev" {
  name             = "newdatasql-${var.env}"
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }
}


module "dev_trigger" {
  source           = "./modules/dev_trigger"
  app_name         = "shop-sphere-users-${var.env}"
  github_owner     = "shashank-rudra-lab"
  github_repo_name = "shopsphere-users"
  cloudbuild_path  = "cloudbuild.yaml"
  branch_name      = "master"
}

