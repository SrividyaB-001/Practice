FROM gcr.io/mtech-scm-platform/scm/basecontainers/openjdk/openjdk-alpine:latest
ARG ARTIFACT_PATH=./availinitload.jar
ENV JAVA_OPTS="-Djava.net.preferIPv4Stack=true ${JAVA_OPTS}"
EXPOSE 8080
COPY ["${ARTIFACT_PATH}", "/opt/macys/app.jar"]
COPY docker-entrypoint.sh /opt/macys/
WORKDIR /opt/macys
ENTRYPOINT ["sh", "docker-entrypoint.sh"]
HEALTHCHECK --interval=1m --timeout=20s --retries=5 CMD curl --fail http://localhost:8080/actuator/health || exit 1
