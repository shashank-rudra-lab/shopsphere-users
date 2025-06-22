resource "google_cloudbuild_trigger" "dev_trigger" {
  name     = "${var.app_name}-trigger"
  location = "global"

  github {
    owner = var.github_owner
    name  = var.github_repo_name

    push {
      branch = "^${var.branch_name}$"
    }
  }

  filename = var.cloudbuild_path
  service_account = "projects/silent-octagon-460701-a0/serviceAccounts/silent-octagon-460701-a0@appspot.gserviceaccount.com"
}

output "trigger_id" {
  value = google_cloudbuild_trigger.dev_trigger.id
}

