variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
  version = "~> 1.11"
}

data "digitalocean_ssh_key" "colin" {
  name = "Colin MacBook Pro (15-inch, 2018)"
}

# When wiping the server and rebuilding don't remove the floating IP, just the assignment below
resource "digitalocean_floating_ip" "sb_api_ip" {
  region = "sgp1"
}

resource "digitalocean_droplet" "sb_api_01" {
  image  = "ubuntu-18-04-x64"
  name   = "sb-api-01"
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  monitoring = true
  ssh_keys = [data.digitalocean_ssh_key.colin.id]
}

resource "digitalocean_floating_ip_assignment" "sb_api_ip_assingment" {
  ip_address = digitalocean_floating_ip.sb_api_ip.ip_address
  droplet_id = digitalocean_droplet.sb_api_01.id
}
