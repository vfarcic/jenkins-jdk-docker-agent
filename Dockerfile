FROM openjdk:8-jdk-alpine

LABEL org.label-schema.vendor="vfarcic" \
    org.label-schema.name="jenkins-jdk-docker-agent" \
    org.label-schema.description="Jenkins agent with JDK, Docker, and Docker Compose" \
    org.label-schema.usage="/src/README.md" \
    org.label-schema.url="https://github.com/vfarcic/jenkins-jdk-docker-agent/blob/master/README.md" \
    org.label-schema.vcs-url=$vcs_url \
    org.label-schema.vcs-branch=$vcs_branch \
    org.label-schema.vcs-ref=$commit_hash \
    org.label-schema.version=$version \
    org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$build_date

ENV DOCKER_VERSION=1.13.1
ENV DOCKER_COMPOSE_VERSION=1.11.1

RUN apk --update --no-cache add tar curl git python py-pip \
    && curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-$DOCKER_VERSION.tgz | tar --strip-components=1 -xz -C /usr/local/bin docker/docker \
    && pip install docker-compose
