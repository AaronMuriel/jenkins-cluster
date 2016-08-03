#!/usr/bin/env bash

PARAMS=""

# The complete target Jenkins URL like 'http://server:8080/jenkins/'. If this option is specified, auto-discovery will be skipped
if [[ "$@" != *"-master "* ]] && [ ! -z "$JENKINS_MASTER" ]; then
	PARAMS="$PARAMS -master $JENKINS_MASTER"
fi

# Setting defauls Username and Passwords
PARAMS="$PARAMS -username jenkins -password jenkins"

# Number of executors - One executor per Docker container
PARAMS="$PARAMS -executors 1"

exec java $JAVA_OPTS -jar $HOME/swarm-client-jar-with-dependencies.jar -fsroot $HOME $PARAMS "$@"
