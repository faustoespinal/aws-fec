#!/bin/bash

CLUSTER_NAME="$1"
INSTANCE_COUNT=2
IAM_INSTANCE_PROFILE_NAME="ecsInstanceRole"
KEY_PAIR_ID="fausto-ec2-keypair"
SECURITY_GROUP_ID="sg-1fc6ad65"
ECS_AMI_ID="ami-1924770e"
#ECS_AMI_ID="ami-2b3b6041"

echo "Creating cluster ${CLUSTER_NAME}"

echo -e "#!/bin/bash\necho ECS_CLUSTER=${CLUSTER_NAME} >> /etc/ecs/ecs.config" > /tmp/cluster.tmp

echo "------------------------------------------------------------------------------------"
#aws ecs create-cluster --cluster-name $CLUSTER_NAME

echo "------------------------------------------------------------------------------------"
aws ecs list-clusters

echo "------------------------------------------------------------------------------------"
aws ec2 run-instances --image-id ${ECS_AMI_ID} --count ${INSTANCE_COUNT} \
--instance-type t2.micro --iam-instance-profile Name=${IAM_INSTANCE_PROFILE_NAME} \
--key-name ${KEY_PAIR_ID} --security-group-ids ${SECURITY_GROUP_ID} \
--user-data file:///tmp/cluster.tmp

#aws ecs list-container-instances --cluster ${CLUSTER_NAME}
#aws ec2 terminate-instances --instance-ids i-02914f86