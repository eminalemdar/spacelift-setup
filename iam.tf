resource "aws_iam_role" "spacelift_role" {
  name = "spacelift_role"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      jsondecode(data.spacelift_aws_integration_attachment_external_id.example_stack.assume_role_policy_statement)
    ]
  })

  tags = {
    Name = "spacelift_role"
  }
}

resource "aws_iam_role_policy" "power_policy" {
  name = "power_policy"
  role = aws_iam_role.spacelift_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        NotAction = [
          "iam:*",
          "organizations:*",
          "account:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
            "iam:CreateServiceLinkedRole",
            "iam:DeleteServiceLinkedRole",
            "iam:ListRoles",
            "organizations:DescribeOrganization",
            "account:ListRegions"
        ]
        Resource = "*"
      }
    ]
  })
}