[
  {
    "name": "${service_name}",
    "image": "${app_image}",
    "user": "node",
    "memory": 512,
    "networkMode": "awsvpc",
    "portMappings": [
      {
        "containerPort": 8080,
        "hostPort": 8080
      }
    ],
    "ulimits": [
      {
        "name": "nofile",
        "softLimit": 8192,
        "hardLimit": 16384
      }
    ],
    "essential": true,
    "environment": [
      {
        "name": "GIT_COMMIT_REFERENCE",
        "value": "${git_commit_reference}"
      },
      {
        "name": "APP_ENV",
        "value": "${terraform_workspace}"
      },
      {
        "name": "ENABLE_GRAPHQL_PLAYGROUND",
        "value": "${enable_graphql_playground}"
      },
      {
        "name": "MULTISERVICES_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "CALENDARS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "CALENDARS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "CONFIGURATIONS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "TRADESPERSONS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "JOBS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "CUSTOMERS_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "JOBSHEET_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "AUTH_SERVICE_URL",
        "value": "${multiservices_url}"
      },
      {
        "name": "INVOICE_SERVICE_URL",
        "value": "${multiservices_url}"
      }
    ],
    "secrets": [
      {
        "name": "SERVICE_SECRET",
        "valueFrom": "${service_secret_arn}"
      },
      {
        "name": "AUTH_SHARED_SECRET",
        "valueFrom": "${auth_shared_secret_arn}"
      }
    ],
    "healthCheck": {
      "retries": 3,
      "command": ["CMD-SHELL", "node healthcheck.js"],
      "timeout": 5,
      "interval": 30,
      "startPeriod": null
    }
  },
  {
    "name": "xray-daemon",
    "image": "amazon/aws-xray-daemon",
    "user": "1337",
    "essential": true,
    "cpu": 32,
    "memoryReservation": 256,
    "portMappings": [
      {
        "hostPort": 2000,
        "containerPort": 2000,
        "protocol": "udp"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "/fargate/services/${full_service_name}",
        "awslogs-region": "${region}",
        "awslogs-stream-prefix": "xray"
      }
    }
  },
  {
    "name": "log_router",
    "image": "amazon/aws-for-fluent-bit:latest",
    "essential": true,
    "firelensConfiguration": {
      "type": "fluentbit",
      "options": {
        "enable-ecs-log-metadata": "true",
        "config-file-type": "file",
        "config-file-value": "/fluent-bit/configs/parse-json.conf"
      }
    }
  }
]
