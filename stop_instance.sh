#! /usr/bin/env bash

INSTANCE=p100
PROJECT=causal-u-net

gcloud compute instances stop $INSTANCE --project=$PROJECT

# eof
