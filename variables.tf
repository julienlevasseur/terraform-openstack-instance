variable "name" {
  description = "A unique name for the resource"
}

variable "image_name" {
  description = "The name of the desired image for the server"
}

variable "flavor_name" {
  description = "The name of the desired flavor for the server"
}

variable "key_pair" {
 description = "The key pair must already be created and associated with the tenant's account"
}

variable "security_groups" {
  description = "An array of one or more security group names to associate with the server"
  type = "list"
}

variable "network" {
  description = "An array of one or more networks to attach to the instance"
}
