aws2 ecr create-repository --repository-name javalin-repo --region eu-west-1

aws2 ecs register-task-definition --region eu-west-1 --cli-input-json file://httpd-td.json

aws2 ecs register-task-definition --region eu-west-1 --cli-input-json file://taskdef.json

aws2 ecs create-cluster --region eu-west-1 --capacity-providers FARGATE FARGATE_SPOT --cluster-name fargate

aws2 ecs create-cluster --region eu-west-1 --cluster-name fargate

aws2 ecs create-service --region eu-west-1 --service-name javalin-service ^
     --task-definition javalin-app-td:10 --desired-count 1 ^
     --launch-type "FARGATE" ^
     --network-configuration "awsvpcConfiguration={subnets=[subnet-fcc5779b,subnet-f7a318be],securityGroups=[sg-043ab03ec99b60369],assignPublicIp=ENABLED}" ^
     --cluster fargate
