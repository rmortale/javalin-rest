
aws2 ecs create-service --region eu-west-1 --service-name javalin-service ^
     --task-definition javalin-app-td --desired-count 1 ^
     --launch-type "FARGATE" ^
     --network-configuration "awsvpcConfiguration={subnets=[subnet-fcc5779b,subnet-f7a318be],securityGroups=[sg-043ab03ec99b60369],assignPublicIp=ENABLED}" ^
     --cluster fargate
