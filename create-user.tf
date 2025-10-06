provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "admin-user" {
  name = var.operators[count.index]
  count = length(var.operators)
  tags = {
    Description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "adminUser" {
  name        = "test-iam-policy"
  policy      = file("user-policy.json")
  description = "Policy for Admin Users."
}

#resource "aws_iam_policy_attachment" "basic-user-acces" {
#  name       = "test-attachment"
#  users      = var.operators[count.index]
#  policy_arn = aws_iam_policy.adminUser.arn
#  count = length(var.operators)
#}