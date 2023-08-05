Terragrunt is used to keep terraform code DRY and easily maintainable

In the terratest(root) folder, we have two environment folder: Staging and Prod

-- Draw tree graph to see structure of folder

Defining a Remote Backend(AWS S3)

In the root folder, create a terragrunt.hcl file to write the code to configure an S3 bucket
which will be automatically created (check terragrunt documentation)
