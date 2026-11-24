# module "catalogue" {
#     source = "terraform-aws-modules/security-group/aws"
#     name = "${local.common_name_suffix}-catalogue"
#     description = "security group for catalogue with custon ports open within vpc, egress all traffic."
#     vpc_id = data.aws_ssm_parameter.vpc_id.value

#     use_name_prefix = false
    
# }

module "sg" {
    count = length(var.sg_names)
    source = "../../terraform-aws-sg"
    #source = "git::https://github.com/shivanandareddyathmakur/terraform-aws-sg.git?ref=main"  
    project_name = var.project_name
    environment = var.environment
    sg_name = var.sg_names[count.index]
    sg_description = "created for ${var.sg_names[count.index]}"
    vpc_id = local.vpc_id
  
}

# module "sg" {
#   count = length(var.sg_names)
#   source = "git::https://github.com/daws-86s/terraform-aws-sg.git?ref=main"
#   project_name = var.project_name
#   environment = var.environment
#   sg_name = var.sg_names[count.index]
#   sg_description = "Created for ${var.sg_names[count.index]}"
#   vpc_id =  local.vpc_id
# }

#frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend_frontend_ALB" {
#     security_group_id = module.sg[9].sg_id #frontend SG ID
#     source_security_group_id   = module.sg[11].sg_id #frontend LB SG ID
#     from_port         = 80
#     protocol       = "tcp"
#     to_port           = 80
#     type           = "ingress"
# }
