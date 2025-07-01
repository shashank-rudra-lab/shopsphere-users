provider "google" {
  project = "silent-octagon-460701-a0"
  region  = "us-central1"
}

# Artifact Registry to store Docker images
resource "google_artifact_registry_repository" "devdocker" {
  project       = var.project_id
  location      = var.region
  repository_id = "project4-dev"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "stgdocker" {
  project       = var.project_id
  location      = var.region
  repository_id = "project4-stg"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "prddocker" {
  project       = var.project_id
  location      = var.region
  repository_id = "project4-prd"
  format        = "DOCKER"
}


module "dev_trigger" {
  source           = "./modules/dev_trigger"
  app_name         = "project4-${var.env}"
  github_owner     = "shashank-rudra-lab"
  github_repo_name = "project-4"
  cloudbuild_path  = "cloudbuild.yaml"
  branch_name      = "main"
}

