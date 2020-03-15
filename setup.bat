aws2 ecr create-repository --repository-name javalin-app --region eu-west-1

aws2 ecs register-task-definition --region eu-west-1 ^
     --cli-input-json file://taskdef.json

aws2 ecs create-cluster --region eu-west-1 --cluster-name fargate

aws2 ecs create-service --region eu-west-1 --service-name javalin-service ^
     --task-definition javalin-app-td:1 --desired-count 2 ^
     --launch-type "FARGATE" ^
     --network-configuration "awsvpcConfiguration={subnets=[subnet-fcc5779b,subnet-fcc5779b],securityGroups=[sg-043ab03ec99b60369]}" ^
     --cluster fargate
