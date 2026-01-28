variable "yc_cloud_id" {
    type = string
}

variable "yc_folder_id" {
    type = string
}

variable "yc_token" {
    type = string
    sensitive = true  
}

variable "yc_zone" {
    type = string
    default = "ru-central1-b"
}

variable "ssh_user" {
    type = string
    default = "ubuntu"
}

variable "ssh_public_key_path" {
    type = string
    default = "~/.ssh/id_ed25519.pub"
}