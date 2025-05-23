provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "govbidder-tf-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "govbidder-tf-lock"
  }
}

module "s3" {
  source = "../../modules/s3"
  env    = "dev"
}

