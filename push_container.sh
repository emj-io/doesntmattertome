#!/usr/bin/env bash
set -x

configure_aws_cli(){
	aws --version
	aws configure set default.region eu-central-1
}

push_ecr_image(){
    eval $(aws ecr get-login --region eu-central-1)
    docker tag doesntmattertome/app:$CIRCLE_SHA1 $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1
    docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1
#    docker tag $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1 \
#               $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:latest
#    docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1
#    docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:latest
}

configure_aws_cli
push_ecr_image
