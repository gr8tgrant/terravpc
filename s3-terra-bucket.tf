resource "aws_s3_bucket" "vpc_terra_bucket" {
    bucket = "vpc-academy-terraform-store-state-s3-by-kevin"
    lifecycle {
      prevent_destroy = true
    }
    tags = {
        Name = "vpc-academy-terraform-store-state-s3-by-kevin"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "vpc_kevin__bucket" {
  bucket = aws_s3_bucket.vpc_terra_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock-vpc"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock-vpc"
  }
}
