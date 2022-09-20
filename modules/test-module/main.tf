variable "instance_name" {
  type    = list(any)
  default = ["instance1", "instance2"]
}

variable "gpu-enabled" {
  type = bool
  default = true
}

locals {
  disks = [
    { "id" : 1, "dev" : "sdb", "sizeGB" : 10 },
    { "id" : 2, "dev" : "sdc", "sizeGB" : 20 }
  ]
}

resource "google_compute_instance" "test-instances" {

  for_each = toset(var.instance_name)
  name     = each.key

  machine_type = "f1-micro"

 lifecycle {
    create_before_destroy = true
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = "custom-for-fucks-sake"
    access_config {}
  }

  allow_stopping_for_update = var.gpu-enabled

dynamic "shielded_instance_config" {
  for_each = var.gpu-enabled ? ["this"] : []
  content {
    enable_secure_boot = true
  }
}

}
