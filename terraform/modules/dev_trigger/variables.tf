variable "app_name" {
  type        = string
  default     = "Project4"
  description = "Name of the app (used in the trigger name)"
}

variable "github_owner" {
  type        = string
  default     = "shashank-rudra-lab"
  description = "GitHub organization or user name"
}

variable "github_repo_name" {
  type        = string
  default     = "project-4"
  description = "GitHub repository name for the app"
}

variable "cloudbuild_path" {
  type        = string
  default     = "cloudbuild.yaml"
  description = "Path to the cloudbuild.yaml file in the repo"
}

variable "branch_name" {
  type        = string
  default     = "main"
  description = "Branch name to trigger builds from"
}
