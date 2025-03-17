## AWS VPC Infrastructure Creation Using Bash Script

# AWS VPC Infrastructure Creation Using Bash Script

## Prerequisites
### Required Tools
    AWS CLI installed and configured with appropriate credentials
    Bash shell environment
    jq (JSON processor)

### Installing jq
```
# Update package list
sudo apt-get update

# Install jq
sudo apt-get install -y jq

# Verify installation
jq --version
```
We need `jq` JSON processor to efficiently reach and write JSON data (JSON parsing), Manipulate data (filter, transform structure, update values, and extract specific fields), validate data that ensures proper JSON formatting. `jq` works well with shell and has query features to support complex queries, pattern matching, data transformation. 
### AWS Configuration
Apply necessary credentials, region (ap-southeast-1), output format. Credential information is available from the lab. 

### VPC Creation using Bash Script
Create a new file named `create-vpc.sh` (I added suffix in the file name for me to easily refer to the lab name) and add the following script: 
```
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

``` 
