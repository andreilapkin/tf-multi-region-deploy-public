terraform {
  backend "s3" {
  encrypt = true
  bucket = "your-s3-bucket-name"                    # REQUIRED # - # Set your bucket name
  region = "us-east-1"                              # REQUIRED # - # Speficy bucket region
  key = "your_project_name/terraform.tfstate"       # REQUIRED # - # You can specify particular path in your bucket if want to host there several Terraform projects
  }
}