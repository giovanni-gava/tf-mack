module "ec2" {
    source = "../modules/ec2"
    region = "us-east-1"
    vpc_id = "vpc-0162a2811ed1ab339"
    instance_name = "ec2-test"
    instance_type = "t2.micro"
    volume_name = "disco-1"
    volume_size = 20
    sg_name = "meu-sg"
    key_name = "terraform.pem"
    allowed_https_cidr_blocks = [ "0.0.0.0/0" ]
    allowed_ssh_cidr_blocks = [ "0.0.0.0/0" ]
}