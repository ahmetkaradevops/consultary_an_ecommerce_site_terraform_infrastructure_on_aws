#Eleven
resource "aws_lambda_function" "to_start_instance_elleven" {
  filename      = "${path.module}/python/start_instances_elleven.zip"
  function_name = "lambda_function_to_start_instance_elleven"
  role          = aws_iam_role.lambda_role.arn
  handler       = "start_instances_elleven.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
resource "aws_lambda_function" "to_start_instance_arya" {
  filename      = "${path.module}/python/start_instances_arya.zip"
  function_name = "lambda_function_to_start_instance_arya"
  role          = aws_iam_role.lambda_role.arn
  handler       = "start_instances_arya.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
resource "aws_lambda_function" "to_stop_instance_elleven" {
  filename      = "${path.module}/python/stop_instances_elleven.zip"
  function_name = "lambda_function_to_stop_instance_elleven"
  role          = aws_iam_role.lambda_role.arn
  handler       = "stop_instances_elleven.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}
resource "aws_lambda_function" "to_stop_instance_arya" {
  filename      = "${path.module}/python/stop_instances_arya.zip"
  function_name = "lambda_function_to_stop_instance_arya"
  role          = aws_iam_role.lambda_role.arn
  handler       = "stop_instances_arya.lambda_handler"
  runtime       = "python3.8"
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

resource "aws_lambda_function_url" "to_start_instance_url_elleven" {
  function_name      = aws_lambda_function.to_start_instance_elleven.function_name
  authorization_type = "NONE"
}
resource "aws_lambda_function_url" "to_start_instance_url_arya" {
  function_name      = aws_lambda_function.to_start_instance_arya.function_name
  authorization_type = "NONE"
}
resource "aws_lambda_function_url" "to_stop_instance_url_elleven" {
  function_name      = aws_lambda_function.to_stop_instance_elleven.function_name
  authorization_type = "NONE"
}
resource "aws_lambda_function_url" "to_stop_instance_url_arya" {
  function_name      = aws_lambda_function.to_stop_instance_arya.function_name
  authorization_type = "NONE"
}

