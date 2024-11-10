# resource "aws_ecs_cluster" "backend_cluster" {
#   name = var.backend_cluster_name
# }

# # Optional: Create an IAM role for ECS tasks
# resource "aws_iam_role" "ecs_task_execution_role" {
#   name = "${var.backend_cluster_name}-ecs-task-execution-role"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Service = "ecs-tasks.amazonaws.com"
#         },
#         Action = "sts:AssumeRole"
#       },
#     ]
#   })
# }

# resource "aws_iam_policy_attachment" "ecs_task_execution_policy_attachment" {
#   name       = "${var.backend_cluster_name}-ecs-task-execution-policy-attachment"
#   roles      = [aws_iam_role.ecs_task_execution_role.name]
#   policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
# }


# resource "aws_ecs_task_definition" "backend_task" {
#   family = "${var.environment}-backend-task"
#   container_definitions = jsonencode([
#     {
#       name      = "first"
#       image     = "service-first"
#       cpu       = 10
#       memory    = 512
#       essential = true
#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#     },
#     {
#       name      = "second"
#       image     = "service-second"
#       cpu       = 10
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 443
#           hostPort      = 443
#         }
#       ]
#     }
#   ])

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [eu-west-2a, eu-west-2b]"
#   }
# }

# resource "aws_ecs_task_definition" "frontend_task" {
#   family = "${var.environment}-frontend-task"
#   container_definitions = jsonencode([
#     {
#       name      = "first"
#       image     = "service-first"
#       cpu       = 10
#       memory    = 512
#       essential = true
#       portMappings = [
#         {
#           containerPort = 80
#           hostPort      = 80
#         }
#       ]
#     },
#     {
#       name      = "second"
#       image     = "service-second"
#       cpu       = 10
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 443
#           hostPort      = 443
#         }
#       ]
#     }
#   ])

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [eu-west-2a, eu-west-2b]"
#   }
# }


# resource "aws_iam_policy" "ecs_task_s3_access_policy" {
#   name = "EcsTaskS3AccessPolicy"

#   policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#       {
#         "Effect": "Allow",
#         "Action": [
#           "s3:*"
#         ],
#         "Resource": [
#           "${aws_s3_bucket.artifact_bucket.arn}",
#           "${aws_s3_bucket.artifact_bucket.arn}/*"
#         ]
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy_attachment" "ecs_task_s3_access" {
#   role       = aws_iam_role.ecs_task_execution_role.name  # Replace with your ECS task execution role
#   policy_arn = aws_iam_policy.ecs_task_s3_access_policy.arn
# }
