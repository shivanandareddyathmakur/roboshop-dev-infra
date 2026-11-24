output "sg_id" {
    value = module.sg[*].sg_id # from terraform aws sg outputs
  
}