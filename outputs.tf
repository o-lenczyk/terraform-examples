output "test-role" {
  value = google_service_account.service_account.email
}



output "project_number" {
  value = data.google_project.project.number
}

/*
output "regions" {
  value = data.google_compute_regions.available.names
}
*/