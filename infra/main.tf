module "ec2" {
    source = "../modules/aws-ec2"
    region = var.region
    vpc_id = var.vpc_id
    instance_name = var.instance_name
    instance_type = var.instance_type 
    volume_name = var.volume_name
    volume_size = var.volume_size
    sg_name = var.sg_name
    key_name = var.key_name
    allowed_https_cidr_blocks = [ "0.0.0.0/0" ]
    allowed_ssh_cidr_blocks = [ "0.0.0.0/0" ]
}