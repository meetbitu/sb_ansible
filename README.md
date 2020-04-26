# Server infrastructure code

## Setup

- create a terraform.tfvars with a real do_token
- `terraform init`
- `terraform plan`
- `terraform apply`
- This bug is blocking the use of terraform-inventory from automatically picking up server info from terraform: https://github.com/adammck/terraform-inventory/issues/131
- Until then you can edit the `ansible_hosts.txt` file then use the custom lando command `ansible-playbook-apply`

## Commands

- (Works when running inside the container) `ansible-playbook setup_ubuntu1804/playbook.yml -l server1 -u root -i ansible_hosts.txt`

## Resources

- https://www.digitalocean.com/community/tutorials/navigator-s-guide-initial-environment-setup
