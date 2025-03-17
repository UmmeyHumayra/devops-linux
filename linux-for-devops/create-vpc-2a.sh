#! /bin/bash

# configuration
REGION  = "ap-southeast-1"
VPC_NAME = "Porishi-VPC"
VPC_CIDR = "10.0.0.0/16"

# Create VPC
echo "Creating VPC....."
VPC_ID = $(aws ec1 create-vpc \
    --cidr-block $VPC_CIDR \
    --region $REGION \
    --query 'Vpc.VpcId' \
    --output text)

