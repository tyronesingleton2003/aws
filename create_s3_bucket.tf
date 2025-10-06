resource "aws_s3_bucket" "family_bucket" {
    bucket = "singleton-alas"
    tags = {
      Description = "Our Family Stuff"
    }
}

resource "aws_s3_object" "family-stuff" {
    source = file(user-policy.json)
    key = "user-policy.json"
    bucket = aws_s3_bucket.family_bucket.id
}