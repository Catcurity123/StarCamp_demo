output "vpc" {
  value = module.vpc
}

output "sg" {
  value = {
    alb     = aws_security_group.alb_sg.id
    asg     = aws_security_group.asg_sg.id
    bastion = aws_security_group.bastion_sg.id
  }
}
