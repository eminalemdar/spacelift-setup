resource "spacelift_worker_pool" "aws_worker" {
  name        = "AWS worker"
  csr         = filebase64("../spacelift.csr")
  description = "Used for all type jobs"
}