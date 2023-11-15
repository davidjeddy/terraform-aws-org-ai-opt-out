# AWS AI opt-out Organization Policy

![How to Stop Feeding AWS’s AI With Your Data BY COREY QUINN](https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/)

- [AWS AI opt-out Organization Policy](#aws-ai-opt-out-organization-policy)
  - [Description](#description)
  - [References](#references)
  - [Requirements](#requirements)
  - [Usage](#usage)

## Description

Unless explicitly opted out, data feed through AWS's AI services is used to train AWS ML models. This module disables all available AI/ML data collection.

## References

- [https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html)
- [https://github.com/gblues/aws-ml-opt-out/tree/master](https://github.com/gblues/aws-ml-opt-out/tree/master)
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [https://us-east-1.console.aws.amazon.com/organizations/v2/home/policies](https://us-east-1.console.aws.amazon.com/organizations/v2/home/policies)
- [https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/](https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/)

## Requirements

- AWS providers >= 4.0
- Terraform >= 1.5
- Linux Shell
- Permissions to modify an AWS Organization in a root account

## Usage

- Add a reference to the module in your project

```hcl
module "org_ai_opt_out" {
  source  = "davidjeddy/overmind/aws"
  version = "0.1.0"

  organization = {
    name = var.name
    id   = var.aws_acct_id
  }
}
```

- Execute `plan` to review the changes

```sh
...
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.org_ai_opt_out.aws_organizations_policy.this will be created
  + resource "aws_organizations_policy" "this" {
      + arn         = (known after apply)
      + description = "Opt out of all Amazon AI services at an organization level"
      + id          = (known after apply)
      + name        = "OptOutOfAllAIServicesPolicy"
      + type        = "AISERVICES_OPT_OUT_POLICY"
    }

  # module.org_ai_opt_out.aws_organizations_policy_attachment.this will be created
  + resource "aws_organizations_policy_attachment" "this" {
      + id        = (known after apply)
      + policy_id = (known after apply)
      + target_id = "REDACTED"
    }

Plan: 2 to add, 0 to change, 0 to destroy.
...
```

- Execute `apply` to deploy the resources

```sh

```
