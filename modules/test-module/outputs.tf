output "public_ip" {
  value = toset([for name in google_compute_instance.test-instances : name.network_interface.0.access_config.0.nat_ip])
}