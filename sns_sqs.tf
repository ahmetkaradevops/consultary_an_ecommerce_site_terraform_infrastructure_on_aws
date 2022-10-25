# Queue
resource "aws_sqs_queue" "my_lambda_restart_queue" {
  name = "my_lambda_restart_queue"
  max_message_size = 262144
  message_retention_seconds = 600
  receive_wait_time_seconds = 0
  visibility_timeout_seconds = 2400
}
# Topic and Subscription
resource "aws_sns_topic" "sns_my_lambda_restart_topic" {
  name = "my_lambda_restart"
}
resource "aws_sns_topic_subscription" "sns_my_lambda_restart_sub" {
  topic_arn = "${aws_sns_topic.sns_my_lambda_restart_topic.arn}"
  protocol  = "email"
  endpoint  = "ahmetkaradevopsaws@gmail.com"
}
# Policy
data "template_file" "sqs-policy" {
  template =  "${file("~/Desktop/try/policies/sqs_policy.json")}"
  vars = {
    sqs_arn = "${aws_sqs_queue.my_lambda_restart_queue.arn}"
    sns_arn = "${aws_sns_topic.sns_my_lambda_restart_topic.arn}"
  }
}
resource "aws_sqs_queue_policy" "my-lambda-restart-sqs-policy" {
  queue_url = "${aws_sqs_queue.my_lambda_restart_queue.id}"
  policy = "${data.template_file.sqs-receive-policy.rendered}"
}

