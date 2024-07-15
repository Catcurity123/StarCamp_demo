################################################################################
# Application load balancer (ALB) variables
################################################################################
variable "vpc" {
  type = any
}

variable "sg" {
  type = any
}

variable "alb_name" {
  description = "Application load balancer name"
  type        = string
  default     = "masterchef-workshop-alb"
}

variable "alb_http_tcp_listeners_port" {
  description = "Application load balancer http listeners port"
  type        = number
  default     = 80
}

variable "alb_target_group_name" {
  description = "Application load balancer target group name"
  type        = string
  default     = "masterchef-workshop-alb-tg"
}

variable "alb_tags" {
  description = "Application load balancer tags"
  type        = map(string)
  default     = { "Name" = "masterchef-workshop-alb", "created-by" = "terraform" }
}


################################################################################
# Auto Scaling Group (ASG) variables
################################################################################

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
  default     = "masterchef-asg"
}

variable "asg_min_size" {
  description = "Auto scaling minimum size"
  type        = number
  default     = 2
}

variable "asg_max_size" {
  description = "Auto scaling maximum size"
  type        = number
  default     = 6
}

variable "asg_desired_capacity" {
  description = "Auto scaling desired capacity"
  type        = number
  default     = 2
}

variable "asg_wait_for_capacity_timeout" {
  description = "Auto scaling wait for capacity timeout"
  type        = number
  default     = 0
}

variable "asg_health_check_type" {
  description = "Auto scaling health check type"
  type        = string
  default     = "EC2"
}

variable "asg_launch_template_name" {
  description = "Name of the autoscaling group launch template"
  type        = string
  default     = "masterchef-lt"
}

variable "asg_launch_template_description" {
  description = "Description of the autoscaling group security group"
  type        = string
  default     = "masterchef-lt-description"
}

variable "asg_update_default_version" {
  description = "Auto scaling group update default version"
  type        = bool
  default     = true
}

variable "asg_image_id" {
  description = "Auto scaling group image id"
  type        = string
  default     = "ami-0a0e5d9c7acc336f1"
}

variable "asg_instance_type" {
  description = "Auto scaling group instance type"
  type        = string
  default     = "t3.medium"
}

variable "asg_ebs_optimized" {
  description = "Auto scaling group ebs optimized"
  type        = bool
  default     = true
}

variable "asg_enable_monitoring" {
  description = "Auto scaling group enable monitoring"
  type        = bool
  default     = true
}

variable "asg_key_name" {
  description = "The name of the SSH key pair to use for the instances"
  type        = string
  default     = "MasterChef_key"
}

variable "asg_create_iam_instance_profile" {
  description = "Auto scaling group create iam instance profile"
  type        = bool
  default     = true
}

variable "asg_iam_role_name" {
  description = "Auto scaling group iam role name"
  type        = string
  default     = "masterchef-asg-iam-role"
}

variable "asg_iam_role_path" {
  description = "Auto scaling group iam role path"
  type        = string
  default     = "/ec2/"
}

variable "asg_iam_role_description" {
  description = "Auto scaling group iam role description"
  type        = string
  default     = "masterchef-asg-iam-role"
}

variable "asg_iam_role_tags" {
  description = "Auto scaling group iam role tags"
  type        = map(string)
  default     = { "Name" = "masterchef-asg-iam-role", "created-by" = "terraform" }
}

variable "asg_block_device_mappings_volume_size_0" {
  description = "Auto scaling group block device mapping volume size 0"
  type        = number
  default     = 20
}

variable "asg_block_device_mappings_volume_size_1" {
  description = "Auto scaling group block device mapping volume size 1"
  type        = number
  default     = 30
}

variable "asg_instance_tags" {
  description = "Auto scaling group instance tags"
  type        = map(string)
  default     = { "Name" = "masterchef-asg-instance", "created-by" = "terraform" }
}

variable "asg_volume_tags" {
  description = "Auto scaling group volume tags"
  type        = map(string)
  default     = { "Name" = "masterchef-asg-volume", "created-by" = "terraform" }
}

variable "asg_tags" {
  description = "Auto scaling group tags"
  type        = map(string)
  default     = { "Name" = "masterchef-asg", "created-by" = "terraform" }
}

