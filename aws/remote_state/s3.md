```terraform
# main.tf
terraform {
  backend "s3" {
    encrypt = true
  }
}

# example of 'partial configuration':
# https://www.terraform.io/docs/backends/config.html#partial-configuration
#
# cat config/backend-dev.conf
bucket  = "<account_id>-terraform-states"
key     = "development/service-name.tfstate"
encrypt = true
region  = "ap-southeast-2"
dynamodb_table = "terraform-lock"
```

> **NOTE**: you'll need a config/dev.tfvars too to set your other environment values.

```bash
env=dev
terraform get -update=true
terraform init -backend-config=config/backend-${env}.conf
terraform plan -var-file=config/${env}.tfvars
terraform apply -var-file=config/${env}.tfvars
```
