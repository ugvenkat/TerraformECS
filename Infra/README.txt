https://medium.com/@fran6_ca/how-to-deploy-a-net-core-api-to-aws-using-terraform-and-docker-9ba69ac065aa
https://www.hostinger.com/tutorials/docker-remove-all-images-tutorial/#How_to_Remove_Docker_Containers
https://blog.searce.com/aws-cicd-with-ecs-cluster-fargate-3ba294ca9fd
https://www.youtube.com/watch?v=fPkO3644kDU  watch video from 13.03 onwards for CICD.


aws iam create-user --user-name adminuser
aws iam create-login-profile --user-name adminuser --password Venkat123!@#
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AdministratorAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSCodeCommitFullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSCodeDeployFullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSCodePipelineFullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess --user-name adminuser
aws iam attach-user-policy --policy-arn arn:aws:iam::aws:policy/CloudWatchLogsFullAccess --user-name adminuser
aws iam create-access-key --user-name adminuser
aws configure

// run aws configure and enter the credentials of adminuser 

aws ecr create-repository --repository-name sample_api
aws sts get-caller-identity


aws codecommit create-repository --repository-name my_webpage --repository-description "Venkat Repo"

**  build docker file **

docker build --rm --pull -f Dockerfile -t sample_api . 
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 039865465269.dkr.ecr.us-east-1.amazonaws.com
docker tag sample_api:latest 039865465269.dkr.ecr.us-east-1.amazonaws.com/sample_api:latest
docker push 039865465269.dkr.ecr.us-east-1.amazonaws.com/sample_api:latest



Now to go the ECR and get the instructions and upload the image manually.


goto vars.tf and setup account id which is 443374801248



terraform init
terraform plan 
terraform apply -auto-approve
