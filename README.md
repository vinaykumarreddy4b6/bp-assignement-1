# Assignment-1

Please follow below steps to create a simple postgresql DB server in AWS RDS using this repo. You need to have terraform installed on your machine as a pre-requisite.

1. Clone this repo and go to the folder bp-assignment-1 using command line prompt/git bash/windows powershell

2. Export below commands
```
export AWS_ACCESS_KEY_ID=<Your AWS access_key_id>
```
```
export AWS_SECRET_ACCESS_KEY=<Your AWS secret key>
```

2. Execute below command to intiate the terraform.
```
terraform init
```
3. Execute the below command to apply the changes and it will create Postgres DB server in AWS RDS. You need to enter the DB password and also enter yes when it prompts on the screen for DB password and continue the operation.
```
terraform apply
```
