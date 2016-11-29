FROM python:2.7
MAINTAINER doesntmattertome "doesntmattertome@unicorn.rentals"

#App config
ENV service_name=doesntmattertome
ENV APP_HOME=/srv/doesntmattertome
ENV API_KEY=

WORKDIR $APP_HOME

RUN apt-get -y install wget
RUN pip install boto3 flask pymemcache

# App installation
COPY . /srv/doesntmattertome

# Metadata
ARG service_name
ARG git_sha
ARG git_branch

LABEL service_name=${service_name}
LABEL git_sha=${git_sha}
LABEL git_branch=${git_branch}

CMD ["/usr/local/bin/python", "server.py", $API_KEY, 'https://dashboard.cash4code.net/score''