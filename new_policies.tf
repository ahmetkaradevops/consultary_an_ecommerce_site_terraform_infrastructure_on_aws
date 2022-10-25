resource "aws_iam_policy" "my-lambda-sqs-policy" {
  name = "my-lambda-sqs-policy"
  description = "Allow lambda function to read sqs message."
  policy = "${data.template_file.sqs-receive-policy.rendered}"
}
resource "aws_iam_policy" "my-lambda-ec2-policy" {
  name = "my-lambda-ec2-policy"
  description = "Allow lambda function to manipulate ec2 instances."
  policy = "${data.template_file.ec2-policy.rendered}"
}
resource "aws_iam_policy" "my-lambda-elb-policy" {
  name = "my-lambda-elb-policy"
  description = "Allow lambda function to manipulate elb."
  policy = "${data.template_file.elb-policy.rendered}"
}
data "template_file" "sqs-receive-policy" {
  template = "${file("${path.module}/policies/sqs-receive-policy.json")}"
  vars = {
    sqs_arn = "${aws_sqs_queue.my_lambda_restart_queue.arn}"
  }
}
data "template_file" "ec2-policy" {
  template = "${file("${path.module}/policies/ec2-policy.json")}"
}
data "template_file" "elb-policy" {
  template = "${file("~/Desktop/try/policies/elb-logs-policy.json")}"
}
resource "aws_iam_role_policy_attachment" "role-policy-attachment-lambda-receive-sqs" {
  role = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.my-lambda-sqs-policy.arn}"
}
resource "aws_iam_role_policy_attachment" "role-policy-attachment-lambda-ec2" {
  role = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.my-lambda-ec2-policy.arn}"
}
resource "aws_iam_role_policy_attachment" "role-policy-attachment-lambda-elb" {
  role = "${aws_iam_role.lambda_role.name}"
  policy_arn = "${aws_iam_policy.my-lambda-elb-policy.arn}"
}

