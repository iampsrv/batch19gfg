
resource "aws_ecrpublic_repository" "aws_ecr_repo_pub" {

  repository_name = "aws_ecr_repo_pub_batchfifteen-tf"

  catalog_data {
    about_text        = "This ecr pub repo is created by terraform"
    architectures     = ["ARM", "ARM 64"]
    operating_systems = ["Linux", "Windows"]
  }
}

resource "aws_ecs_task_definition" "flaskapp_task_def" {
  family                   = "flaskapp_task_def_batchtwelve-tf"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 1024
  memory                   = 2048
  task_role_arn            = "arn:aws:iam::686766985335:role/ecsTaskExecutionRole"
  execution_role_arn       = "arn:aws:iam::686766985335:role/ecsTaskExecutionRole"
  runtime_platform {
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name  = "myflaskcontainer"
      image = "public.ecr.aws/c2s9r9y6/aws_ecr_repo_pub_batchtwelve-tf:latest"
      essential = true
      portMappings = [
        { "protocol"    = "tcp"
          containerPort = 8080
          hostPort      = 8080
        }
      ]
      logConfiguration = {
        "logDriver" = "awslogs",
        "options" = {
          "awslogs-group"         = "/ecs/flaskapp_task_def_batchtwelve-tf",
          "awslogs-region"        = "us-east-1",
          "awslogs-stream-prefix" = "ecs"
      } }
    }
  ])
}

resource "aws_ecs_task_definition" "flaskapp_task_defec2" {
  family                = "flaskapp_task_def_batchtwelve-tfec2"
  cpu    = 512
  memory = 512
  requires_compatibilities = ["EC2"]
  task_role_arn      = "arn:aws:iam::686766985335:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::686766985335:role/ecsTaskExecutionRole"
  network_mode             = "bridge" 
  container_definitions = jsonencode([
    {
      name      = "myflaskcontainer"
      image     = "public.ecr.aws/c2s9r9y6/aws_ecr_repo_pub_batchtwelve-tf:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/flaskapp_task_def_batchtwelve-tf"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}


