#! /usr/bin/env bash

# Usage: copy this script and customize the variables below.

INSTANCE_NAME=p100
PROJECT=causal-u-net

# For GPU support, must be one of:
#
#  us-west1-b, us-central1-c, us-central1-f, us-east1-b, us-east1-c
ZONE=us-east1-c

# Available machine types:
#   https://cloud.google.com/compute/docs/machine-types#predefined_machine_types
TYPE=n1-standard-8

# Hardware:
GPU=nvidia-tesla-p100
COUNT=1

DISK=pd-ssd
SPACE=100GB

IMAGE_FAMILY=ubuntu-1604-lts
IMAGE_PROJECT=ubuntu-os-cloud

STARTUP_SCRIPT=startup_scripts/cuda_9_0_ubuntu_16.sh

gcloud beta compute instances create $INSTANCE_NAME \
       --machine-type $TYPE \
       --zone $ZONE \
       --accelerator type=$GPU,count=$COUNT \
       --boot-disk-size $SPACE --boot-disk-type $DISK \
       --image-family $IMAGE_FAMILY --image-project $IMAGE_PROJECT \
       --maintenance-policy TERMINATE \
       --no-restart-on-failure \
       --project $PROJECT \
       --metadata-from-file startup-script=$STARTUP_SCRIPT

# eof
