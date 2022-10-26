resource "aws_cloudwatch_metric_alarm" "low_cpu_usage_arya" {
  alarm_name          = "ARYA Idle Server Alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Maximum"
  period              = 1800 # The period in seconds over which the specified statistic is applied.
  threshold           = 6
  treat_missing_data  = "missing"
  alarm_actions       = [
    # "${aws_sns_topic.sns_my_lambda_restart_topic.arn}",
    "arn:aws:automate:eu-west-2:ec2:stop"]
  # depends_on          = [aws_instance.arya.id]
  alarm_description   = "This metric monitors EC2 cpu utilization and stops the instance when requirements met."
  dimensions          = {
    InstanceId = aws_instance.arya.id
  }
}
# source: https://registry.terraform.io/providers/aaronfeng/aws/latest/docs/resources/cloudwatch_metric_alarm

resource "aws_cloudwatch_metric_alarm" "low_cpu_usage_eva" {
  alarm_name          = "Eva Idle Server Alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Maximum"
  period              = 1800 # The period in seconds over which the specified statistic is applied.
  threshold           = 6
  treat_missing_data  = "missing"
  alarm_actions       = [
    # "${aws_sns_topic.sns_my_lambda_restart_topic.arn}",
    "arn:aws:automate:eu-west-2:ec2:stop"]
  # depends_on          = [aws_sns_topic.sns_my_lambda_restart_topic]
  alarm_description   = "This metric monitors EC2 cpu utilization and stops the instance when requirements met."
  dimensions          = {
    InstanceId = aws_instance.eva.id
  }
}
resource "aws_cloudwatch_metric_alarm" "low_cpu_usage_elleven" {
  alarm_name          = "Elleven Idle Server Alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  statistic           = "Maximum"
  period              = 1800 # The period in seconds over which the specified statistic is applied.
  threshold           = 6
  treat_missing_data  = "missing"
  alarm_actions       = [
    # "${aws_sns_topic.sns_my_lambda_restart_topic.arn}",
    "arn:aws:automate:eu-west-2:ec2:stop"]
  # depends_on          = [aws_sns_topic.sns_my_lambda_restart_topic]
  alarm_description   = "This metric monitors EC2 cpu utilization and stops the instance when requirements met."
  dimensions          = {
    InstanceId = aws_instance.elleven.id
  }
}

