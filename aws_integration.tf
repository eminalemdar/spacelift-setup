data "aws_caller_identity" "current" {}

locals {
  role_name = "spacelift_role"
  role_arn  = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.role_name}"
}

resource "spacelift_aws_integration" "aws" {
  name = local.role_name

  # We need to set the ARN manually rather than referencing the role to avoid a circular dependency
  role_arn                       = local.role_arn
  generate_credentials_in_worker = true
}

data "spacelift_aws_integration_attachment_external_id" "example_stack" {
  integration_id = spacelift_aws_integration.aws.id
  stack_id       = "example-stack"
  read           = true
  write          = true
}

resource "spacelift_aws_integration_attachment" "example_stack_attachment" {
  integration_id = spacelift_aws_integration.aws.id
  stack_id       = "example-stack"
  read           = true
  write          = true

  depends_on = [
    aws_iam_role.spacelift_role
  ]
}

