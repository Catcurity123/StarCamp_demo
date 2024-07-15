terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

module "network" {
  source              = "./modules/network"
  vpc_name            = "MasterChef"
  vpc_cidr            = "10.0.0.0/16"
  vpc_azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  vpc_public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  vpc_private_subnets = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  vpc_tags            = { "Name" = "MasterChef", "created-by" = "terraform" }
}

module "instances" {
  source = "./modules/instances"
  vpc    = module.network.vpc
  sg     = module.network.sg

  alb_name                    = "MasterChef-alb"
  alb_http_tcp_listeners_port = 80
  alb_target_group_name       = "MasterChef-alb-tg"
  alb_tags                    = { "Name" = "MasterChef-alb", "created-by" = "terraform" }

  asg_name                                = "MasterChef-asg"
  asg_min_size                            = 2
  asg_max_size                            = 6
  asg_desired_capacity                    = 2
  asg_wait_for_capacity_timeout           = 0
  asg_health_check_type                   = "EC2"
  asg_launch_template_name                = "MasterChef-lt"
  asg_launch_template_description         = "MasterChef-lt"
  asg_update_default_version              = true
  asg_image_id                            = "ami-0a0e5d9c7acc336f1"
  asg_instance_type                       = "t3.medium"
  asg_ebs_optimized                       = true
  asg_enable_monitoring                   = true
  asg_create_iam_instance_profile         = true
  asg_iam_role_name                       = "MasterChef-asg-iam-role"
  asg_iam_role_path                       = "/ec2/"
  asg_iam_role_description                = "MasterChef-asg-iam-role"
  asg_iam_role_tags                       = { "Name" = "MasterChef-asg-iam-role", "created-by" = "terraform" }
  asg_block_device_mappings_volume_size_0 = 20
  asg_block_device_mappings_volume_size_1 = 30
  asg_instance_tags                       = { "Name" = "MasterChef-asg-instance", "created-by" = "terraform" }
  asg_volume_tags                         = { "Name" = "MasterChef-asg-volume", "created-by" = "terraform" }
  asg_tags                                = { "Name" = "MasterChef-asg", "created-by" = "terraform" }
  asg_key_name                            = "MasterChef_key"
}

module "management" {
  source = "./modules/management"
  vpc    = module.network.vpc
  sg     = module.network.sg

  ec2_name          = "MasterChef_Bastion_Host"
  ec2_instance_type = "t2.micro"
  ec2_key_name      = "MasterChef_key"
}