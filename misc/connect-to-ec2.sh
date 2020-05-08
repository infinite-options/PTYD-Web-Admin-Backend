#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0" )" && pwd )"
EC2_KEY_DIR=$BASE_DIR"/aws-ec2-ptyd-admin.pem"
EC2_ENDPOINT="ec2-user@ec2-18-236-97-142.us-west-2.compute.amazonaws.com"

ssh -i $EC2_KEY_DIR $EC2_ENDPOINT
