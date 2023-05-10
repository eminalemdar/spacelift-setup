resource "aws_iam_role" "spacelift_role" {
  name = "spacelift_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Condition = {
              StringLike = {
                "sts:ExternalId" = "emin@*"
              }
        }
        Principal = {
          AWS = "247747705325"
        }
      },
    ]
  })

  tags = {
    Name = "spacelift_role"
  }
}