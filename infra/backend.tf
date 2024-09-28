terraform {
  backend "s3" {
    bucket = "aws-prd-state-mack-iac-pipeline"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}