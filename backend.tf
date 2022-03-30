terraform {
  backend "s3" {
    bucket = "vpc-academy-terraform-store-state-s3-by-kevin"
    key    = "terraform.tfstate"
    dynamodb_table = "terraform-lock-vpc"
  }
}
