#!/usr/bin/env bash

configure_aws_cli(){
	aws --version
	aws configure set default.region eu-central-1
}

push_ecr_image(){
	eval $(aws ecr get-login --region us-central-1)
        docker tag 133552650589.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1 \
                   133552650589.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:latest
	docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:$CIRCLE_SHA1
	docker push $AWS_ACCOUNT_ID.dkr.ecr.eu-central-1.amazonaws.com/doesntmattertome/app:latest
}

configure_aws_cli
push_ecr_image
