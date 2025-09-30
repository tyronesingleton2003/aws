resource "aws_iam_user" "admin-user" {
  name = "willie"
  tags = {
    Description = "Technical Team Leader"
  }
}

resource "aws_iam_policy" "adminUser" {
  name        = "test-iam-policy"
  policy      = file("user-policy.json")
  description = "Policy for Admin Users."
}

resource "aws_iam_policy_attachment" "basic-user-acces" {
  name       = "test-attachment"
  users      = [aws_iam_user.admin-user.name]
  policy_arn = aws_iam_policy.adminUser.arn
}