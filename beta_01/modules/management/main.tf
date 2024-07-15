################################################################################
# Bastion Host 
################################################################################
module "ec2-instance" {
    source  = "terraform-aws-modules/ec2-instance/aws"

    name = var.ec2_name
    ami = var.ec2_ami
    instance_type          = var.ec2_instance_type
    key_name               = var.ec2_key_name
    monitoring             = true
    subnet_id              = var.vpc.public_subnets[1]
    vpc_security_group_ids = [var.sg.bastion]
    associate_public_ip_address = true

    tags = {
      Terraform   = "true"
      Environment = "dev"
    }
}
