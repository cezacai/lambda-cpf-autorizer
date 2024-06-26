provider "aws" {
  region = "us-east-1" # Substitua pela sua região
}

resource "aws_lambda_function" "lambda_function" {
  filename      = var.TF_LAMBDA_ZIP_PATH
  function_name = "AutenticacaoClienteHandler"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role_cpf_authorizer"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}




