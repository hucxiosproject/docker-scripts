#!/bin/bash

source /data/env
eval "$(weave env)"

mkdir -p /data/volumes/gitlab/postgresql
docker run --name=postgresql-gitlab -d \
	-e DB_NAME=gitlabhq_production \
	-e DB_USER=gitlab \
	-e DB_PASS=password \
	-v /data/volumes/gitlab/postgresql:/var/lib/postgresql \
	sameersbn/postgresql:9.4

mkdir -p /data/volumes/gitlab/redis
docker run --name=redis-gitlab -d \
	-v /data/volumes/gitlab/redis:/var/lib/redis \
	sameersbn/redis:latest

mkdir -p /data/volumes/gitlab/gitlab
docker run --name gitlab -d \
	--link=postgresql-gitlab:postgresql --link=redis-gitlab:redisio \
	-p 1022:22 \
	-e GITLAB_HOST="$GITLAB_HOST" \
	-e GITLAB_TIMEZONE="$GITLAB_TIMEZONE" \
	-e GITLAB_PORT="$GITLAB_PORT" \
	-e GITLAB_SSH_PORT="$GITLAB_SSH_PORT" \
	-e GITLAB_EMAIL="$GITLAB_EMAIL" \
	-e SMTP_DOMAIN="$SMTP_DOMAIN" \
	-e SMTP_HOST="$SMTP_HOST" \
	-e SMTP_PORT="$SMTP_PORT" \
	-e SMTP_USER="$SMTP_USER" \
	-e SMTP_PASS="$SMTP_PASS" \
	-e SMTP_TLS="$SMTP_TLS" \
	-e SMTP_OPENSSL_VERIFY_MODE="$SMTP_OPENSSL_VERIFY_MODE" \
	-e SMTP_AUTHENTICATION="$SMTP_AUTHENTICATION" \
	-v /data/volumes/gitlab/gitlab:/home/git/data \
	-e VIRTUAL_HOST="$GITLAB_VIRTUAL_HOST" \
	-e VIRTUAL_PORT="$GITLAB_VIRTUAL_PORT" \
	sameersbn/gitlab:7.12.2-2


