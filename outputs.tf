output "test-role" {
  value = google_service_account.service_account.email
}

output "public_ip" {
  value = toset([ for name in google_compute_instance.test-instances : name.network_interface.0.access_config.0.nat_ip ])
}

output "project_number" {
  value = data.google_project.project.number
}

/*
output "regions" {
  value = data.google_compute_regions.available.names
}
*/