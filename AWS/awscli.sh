aws ec2 run-instances --image-id ami-0ed9277fb7eb570c9 --instance-type t2.micro --key-name AWS_KEYS --security-group-ids sg-09ebede5ce61755a7 --subnet-id
subnet-02b2cad9fbd325ffe --user-data file://httpd.sh

aws elbv2 create-load-balancer --name my-ladbalancer --subnets subnet-02b2cad9fbd325ffe subnet-0336ed3d1de07a17b subnet-09268eb7bc866e030 --security-groups sg-09ebede5ce61755a7

aws elbv2 register-targets --target-group-arn arn:aws:elasticloadbalancing:us-east-1:457926834060:targetgroup/my-targets/d8caf692ce2881aa --targets Id=i-073dac299f23e7938 Id=i-08eb2df337c19d062

aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:us-east-1:457926834060:loadbalancer/app/my-ladbalancer/9bb08cad95a8044f --protocol HTTP --port 80 --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:us-east-1:457926834060:targetgroup/my-targets/d8caf692ce2881aa
