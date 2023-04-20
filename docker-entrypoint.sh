#!/bin/sh

_term() {
  echo "Caught SIGTERM or SIGINT signal!"
  kill $child
  wait $child
  exit $?
}

trap _term SIGINT SIGTERM

java $JAVA_OPTS -jar /opt/macys/app.jar --spring.config.location=file:${CONFIG_FILE}/ &

child=$!
wait $child
