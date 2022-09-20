variable "service_account_id" {
  sensitive = true
  validation {
    condition     = length(var.service_account_id) > 5
    error_message = "Service account ID is too short"
  }
}

locals {
  service_account_display_name = "Test Service Account"
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = local.service_account_display_name
}

resource "google_project_iam_custom_role" "test-role2" {
  role_id     = "myTestRole"
  title       = "My Test Role"
  description = "A description"
  permissions = ["compute.projects.get", "compute.images.list"]
}

resource "google_service_account_iam_binding" "test" {
  service_account_id = google_service_account.service_account.name
  role               = google_project_iam_custom_role.test-role2.name
  members = [
    "serviceAccount:${google_service_account.service_account.email}"
  ]
  depends_on = [
    google_service_account.service_account,
    google_project_iam_custom_role.test-role2
  ]

}
