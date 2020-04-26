variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
  version = "~> 1.11"
}

data "digitalocean_ssh_key" "colin" {
  name = "Colin MacBook Pro (15-inch, 2018)"
}

resource "digitalocean_droplet" "sb_api_01" {
  image  = "ubuntu-18-04-x64"
  name   = "sb-api-01"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys = [data.digitalocean_ssh_key.colin.id]
  count = 1
}
