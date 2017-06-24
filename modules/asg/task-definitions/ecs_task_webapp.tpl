[
  {
    "name": "webapp",
    "image": "${webapp_docker_image}",
    "cpu": 512,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 5000,
        "hostPort": 5000
      }
    ],
    "command": [
      "foreground"
    ],
    "entryPoint": [
      "/opt/app/bin/teebox"
    ],
    "links": [],
    "mountPoints": [],
    "volumesFrom": [],
    "environment": [
      {
        "name": "DB_ENV_NAME",
        "value": "${db_name}"
      },
      {
        "name": "DB_ENV_POSTGRES_HOST",
        "value": "${db_host}"
      },
      {
        "name": "DB_ENV_POSTGRES_PASSWORD",
        "value": "${db_password}"
      },
      {
        "name": "DB_ENV_POSTGRES_USER",
        "value": "${db_user}"
      },
      {
        "name": "HOST",
        "value": "${app_host}"
      },
      {
        "name": "PORT",
        "value": "${app_port}"
      },
      {
        "name": "SECRET_KEY_BASE",
        "value": "${secret_key_base}"
      }
    ]
  }
]
