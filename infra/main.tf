module "ec2" {
    source = "./modules/ec2"
    region = "us-east-1"
    vpc_id = "vpc-063ad540e9672c793"
    instance_name = var.instance_name
    instance_type = var.instance_type 
    volume_name = var.volume_name
    volume_size = var.volume_size
    sg_name = var.sg_name
    key_name = var.key_pair
    allowed_https_cidr_blocks = [ "0.0.0.0/0" ]
    allowed_ssh_cidr_blocks = [ "0.0.0.0/0" ]
}