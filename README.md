# AWS AI opt-out Organization Policy

- [AWS AI opt-out Organization Policy](#aws-ai-opt-out-organization-policy)
  - [Description](#description)
  - [Requirements](#requirements)
  - [Usage](#usage)
  - [Sources](#sources)

## Description

Unless explicitly opted out, data feed through AWS's AI services is used to train AWS ML models. This module disables all available AI/ML data collection. In response to [How to Stop Feeding AWS’s AI With Your Data BY COREY QUINN](https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/).

## Requirements

Infra tools:

- AWS providers ~ 5
- Terraform ~ 1.6 || OpenToFu ~ 1.6
- Permissions to modify an AWS Organization in a root account

And because the AWS provider is missing the ability to interact with Org policy enablement:

- [AWS CLI](https://aws.amazon.com/cli/) ~ 2
- [Bash](https://gnu.org/software/bash/) ~ 5 (or similar Linux shell)
- [jq](https://jqlang.github.io/jq/) ~ 1.6

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

```

- Execute `apply` to deploy the resources

```sh

```

## Sources

- [https://aws.amazon.com/machine-learning/ai-services/](https://aws.amazon.com/machine-learning/ai-services/)
- [https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)
- [https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out_syntax.html](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out_syntax.html)
- [https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_ai-opt-out.html)
- [https://github.com/gblues/aws-ml-opt-out/tree/master](https://github.com/gblues/aws-ml-opt-out/tree/master)
- [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [https://us-east-1.console.aws.amazon.com/organizations/v2/home/policies](https://us-east-1.console.aws.amazon.com/organizations/v2/home/policies)
- [https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/](https://www.lastweekinaws.com/blog/How-to-Stop-Feeding-AWSs-AI-With-Your-Data/)
