resource "aws_ecs_task_definition" "main" {
  family                   = "sample_api"
  memory                   = 512
  cpu                      = 256
  requires_compatibilities = ["FARGATE"]
  task_role_arn            = aws_iam_role.task.arn
  execution_role_arn       = aws_iam_role.task.arn
  network_mode             = "awsvpc"
  container_definitions = jsonencode(
    [{
      "name" : "${var.name}-container-${var.environment}"
      "image" : "${var.ACCOUNT_id}.dkr.ecr.${var.AWS_REGION}.amazonaws.com/sample_api:latest",
      "portMappings" : [
        { containerPort = 80 }
      ],
    }]
  )
}