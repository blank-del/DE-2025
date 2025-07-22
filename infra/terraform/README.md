# Setting up Infrastructure

We will be using terraform (IaC) to set up the infrastructure and to version control the provisioning

```
-- providers.tf
-- main.tf
-- output.tf
-- variables.tf
```

Before running the `main.tf` set a service principal for your account so that terraform can make changes on your behalf
```bash
az ad sp create-for-rbac \
--name <SP_name> \
--role="Contributor" \
--scopes="/subscriptions/<subscription_id>"
```
Once you have the `appid`, `password` set the environment variables so that terraform can authenticate using the credentials, if you have stored them in `.env` file then run the following command:
```bash
export $(cat .env | xargs)
```

## File Structure
Terraform does not care about having different file as long as its `.tf` and in the same folder. Seperating the logic makes the code more readable, easier to maintain, and modular.

### Providers

Without the provideres information terraform would not know where to fetch our infrastructure related information. Each cloud provider has its own set of resources (think of it as import libraries in python 🐍)

### Main

This is the main file which contains the resource definitions (e.g., resource group, storage account, etc.).

### Variables

As the name suggests this contains the key variables that we can use in the `main.tf` file to make our code modular and easier to maintain rather than hardcoding the variables.

### Output.tf
This file contains information that terraform will display after deploying the changes , it can be used for debugging or passing values to other modules.