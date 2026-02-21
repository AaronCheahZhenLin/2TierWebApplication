resource "aws_instance" "webserver1" {
  ami           = "ami-0030e4319cbf4dbf2"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.HTTPandSSH]
  subnet_id = var.subnet1
  user_data = base64encode(file("userdata.sh"))
}

resource "aws_instance" "webserver2" {
  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.HTTPandSSH]
  subnet_id = var.subnet2
  user_data = base64encode(file("userdata1.sh"))
}

resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}