terraform {
  backend "s3" {
    bucket         = "aws-eks-baket1"
    region         = "us-east-1"
    key            = "Jenkins-TF/terraform.tfstate"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}