resource "yandex_vpc_network" "net" {
  name = "tf-net"
}

resource "yandex_vpc_subnet" "sub" {
  name = "tf-subnet"
  zone = var.yc_zone
  network_id = yandex_vpc_network.net.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_instance" "vm" {
  name = "terraform-vm"
  platform_id = "standard-v1"

  resources {
    cores = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8lcd9f54ldmonh1d72"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.sub.id
    nat = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(pathexpand(var.ssh_public_key_path))}"
  }
}