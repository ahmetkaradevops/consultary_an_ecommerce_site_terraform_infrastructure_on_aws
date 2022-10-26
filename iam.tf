### IAM Role and Policy ###
# Allows Lambda function to describe, stop and start EC2 instances
resource "aws_iam_role" "lambda_role" {
  name               = "Lambda_Function_Role"
  assume_role_policy = "${data.template_file.lambda_policy.rendered}"
}

data "template_file" "lambda_policy" {
  template = "${file("${path.module}/policies/lambda.json")}"
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
  name        = "aws_iam_policy_for_lambda_role"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = "${data.template_file.lambda_role_policy.rendered}"
}

data "template_file" "lambda_role_policy" {
  template = "${file("${path.module}/policies/lambda_role.json")}"
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.iam_policy_for_lambda.arn
}

data "archive_file" "zip_the_python_code_start_elleven" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/start_instances_elleven.zip"
}
data "archive_file" "zip_the_python_code_stop_elleven" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/stop_instances_elleven.zip"
}
data "archive_file" "zip_the_python_code_start_eva" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/start_instances_eva.zip"
}
data "archive_file" "zip_the_python_code_stop_eva" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/stop_instances_eva.zip"
}
data "archive_file" "zip_the_python_code_start_arya" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/start_instances_arya.zip"
}
data "archive_file" "zip_the_python_code_stop_arya" {
  type        = "zip"
  source_dir  = "${path.module}/python/"
  output_path = "${path.module}/python/stop_instances_arya.zip"
}
