variable "vpc" {
  type = any
}

variable "sg" {
  type = any
}

# Bastion Host Variables
variable "ec2_name" {
  description = "Name of the Bastion Host"
  type        = string
  default = "Bastion_Host"
}

variable "ec2_instance_type" {
  description = "Type of the Bastion Host"
  type        = string
  default     = "t2.micro"
}

variable "ec2_ami" {
  description = "AMI of the Bastion Host"
  type        = string
  default     = "ami-0a0e5d9c7acc336f1"
}

variable "ec2_key_name" {
  description = "Name of the key pair to use for the Bastion Host"
  type        = string
  default = "MasterChef_key"
}
