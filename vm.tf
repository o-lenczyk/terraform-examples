variable "instance_name" {
  type = list
  default = ["instance1", "instance2"]
}

resource "google_compute_instance" "test-instances" {

  for_each = toset(var.instance_name)
  name = each.key

  machine_type = "f1-micro"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
    network_interface {
      network = "default"
      access_config { }
  }
}
