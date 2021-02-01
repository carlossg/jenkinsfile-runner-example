# Install maven
FROM maven:alpine as maven

# Package jenkinsfile runner and plugins
FROM jenkins/jenkinsfile-runner as jenkinsfile-runner
ARG JENKINSFILE_RUNNER_VERSION=1.0-beta-25
ARG PLUGIN_CLI_VERSION=2.5.0

# Custom tools
RUN apt-get update && apt-get install -y git
COPY --from=maven /usr/share/maven /usr/share/maven
RUN ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# CasC
COPY jenkins.yaml /usr/share/jenkins/ref/casc/jenkins.yaml

# Plugin installation
ENV JENKINS_VERSION=2.235.4
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN curl -fsSL -o /app/bin/jenkins-plugin-manager.jar \
    "https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/${PLUGIN_CLI_VERSION}/jenkins-plugin-manager-${PLUGIN_CLI_VERSION}.jar"  && \
    java -jar /app/bin/jenkins-plugin-manager.jar --plugin-file /usr/share/jenkins/ref/plugins.txt -d /usr/share/jenkins/ref/plugins
