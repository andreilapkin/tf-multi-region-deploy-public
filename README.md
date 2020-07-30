# tf-multi-region-deploy-public
Allows to organise centralised management in different regions using global vars and region- or project-specific options.


### Prerequisites ###
- Install terraform: `https://learn.hashicorp.com/terraform/getting-started/install.html`
- Create `~/.aws/config`
```
[default]
region=us-east-1
output=json
```
- Create `~/.aws/credentials` (you can get them from AWS admin)
```
[default]
aws_access_key_id = XXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXX
```
- Create key pair(s) in target regions `https://docs.aws.amazon.com/ground-station/latest/ug/create-ec2-ssh-key-pair.html` or upload your own

### Structure
`/`                                                 - root folder
`/main.tf`                                          - defines regions modules and passes global variables to them
`/main_vars.tf`                                     - defines global variables
`terraform.tf`                                      - you can use it for remote terraform state in S3 bucket or simply delete and use local storage
```
terraform {
  backend "s3" {
  encrypt = true
  bucket = "your-s3-bucket-name"                    # REQUIRED # - # Set your bucket name
  region = "us-east-1"                              # REQUIRED # - # Speficy bucket region
  key = "your_project_name/terraform.tfstate"       # REQUIRED # - # You can specify particular path in your bucket if want to host there several Terraform projects
  }
}
```

`/region_name/`                                     - module with region definitions
`/region_name/region_name.tf`                       - defines project modules in tihs region and passes global- and region-specific variables to them
`/region_name/region_name_vars.tf`                  - region vars assembled with global vars
```
# Set here your region name, vpc id in this region and a key pair associated with it

  vars = {
      # Specify region and target VPC
      region         = "us-east-1"                  # REQUIRED #
      vpc_id         = "your_vpc_id"                # REQUIRED # - # Set id of VPC used in this region
      public_keys = {
        "main"       = "key_pair_name"              # REQUIRED # - # Put the name of a key pair used in this region
      }
  }
```

`/region_name/project_name/`                        - module with project definitions in this region
`/region_name/project_name/*.tf`                    - sets deploment options for your resources
`/region_name/project_name/project_name_vars.tf`    - consumes region vars and gets all the subnets available to this region