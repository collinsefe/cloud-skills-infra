resource "aws_iam_instance_profile" "mp_profile" {
  name = "mupando-instance-profile"
  role = aws_iam_role.mp_role.name
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "mp_role" {
  name               = "mupando-instance-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}