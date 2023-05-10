locals {
  role_name = aws_iam_role.spacelift_role.name
  role_arn  = aws_iam_role.spacelift_role.arn
}

resource "spacelift_aws_integration" "aws" {
  name = local.role_name

  # We need to set the ARN manually rather than referencing the role to avoid a circular dependency
  role_arn                       = local.role_arn
  generate_credentials_in_worker = true
  depends_on = [
    aws_iam_role.spacelift_role
  ]
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
}

