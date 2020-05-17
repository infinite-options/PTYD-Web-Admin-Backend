#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0" )" && pwd )"

# ptyd-0510.pem is the private key file needed to access EC2 (key pair file)
EC2_KEY_DIR=$BASE_DIR"/ptyd-0510.pem"

# ec2-54-183-61-181.us-west-1.compute.amazonaws.com from Public DNS (IPv4)
EC2_ENDPOINT="ec2-user@ec2-54-183-61-181.us-west-1.compute.amazonaws.com"

ssh -i $EC2_KEY_DIR $EC2_ENDPOINT
