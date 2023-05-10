locals {
  role_name = aws_iam_role.spacelift_role.name
  role_arn  = aws_iam_role.spacelift_role.arn
}

resource "spacelift_aws_integration" "aws" {
  name = local.role_name

  # We need to set the ARN manually rather than referencing the role to avoid a circular dependency
  role_arn                       = local.role_arn
  generate_credentials_in_worker = true
  space_id = "demo-space"
  depends_on = [
    aws_iam_role.spacelift_role
  ]
}

