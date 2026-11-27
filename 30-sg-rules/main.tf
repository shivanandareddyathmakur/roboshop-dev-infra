#frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend_frontend_ALB" {
#     security_group_id = module.sg[9].sg_id #frontend SG ID
#     source_security_group_id   = module.sg[11].sg_id #frontend LB SG ID
#     from_port         = 80
#     protocol       = "tcp"
#     to_port           = 80
#     type           = "ingress"
# }

resource "aws_security_group_rule" "backend_alb_bastion" {
    security_group_id = local.backend_alb_sg_id 
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 80
    protocol       = "tcp"
    to_port           = 80
    type           = "ingress"
}

resource "aws_security_group_rule" "bastion_laptop" {
    security_group_id = local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "mongodb_bastion" {
    security_group_id = local.mongodb_sg_id
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "redis_bastion" {
    security_group_id = local.redis_sg_id
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "rabbitmq_bastion" {
    security_group_id = local.rabbitmq_sg_id
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "mysql_bastion" {
    security_group_id = local.mysql_sg_id
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "catalogue_bastion" {
    security_group_id = local.catalogue_sg_id
    source_security_group_id   = local.bastion_sg_id 
    from_port         = 22
    protocol       = "tcp"
    to_port           = 22
    type           = "ingress"
}

resource "aws_security_group_rule" "mongodb_catalogue" {
    security_group_id = local.mongodb_sg_id
    source_security_group_id   = local.catalogue_sg_id 
    from_port         = 27017
    protocol       = "tcp"
    to_port           = 27017
    type           = "ingress"
}

resource "aws_security_group_rule" "catalogue_backend_alb" {
  type              = "ingress"
  security_group_id = local.catalogue_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port         = 8080
  protocol          = "tcp"
  to_port           = 8080
}