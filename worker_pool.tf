resource "spacelift_worker_pool" "aws" {
  name        = "AWS worker"
  csr         = filebase64("../spacelift.csr")
  description = "AWS Worker Pool"
}