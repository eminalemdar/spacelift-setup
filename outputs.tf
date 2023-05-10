output "aws_iam_role_arn" {
  value = aws_iam_role.spacelift_role.arn
}

output "aws_iam_role_name" {
    value = aws_iam_role.spacelift_role.name
}