# caller
data "aws_caller_identity" "current" {}

# organization
data "aws_organizations_organization" "this" {}

# region
data "aws_region" "current" {}


