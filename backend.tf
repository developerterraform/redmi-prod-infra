terraform {
  backend "s3" {
    bucket = "redmi-git-prod-backend"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
