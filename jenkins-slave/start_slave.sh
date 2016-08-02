#!/usr/bin/env bash

PARAMS=""

# The complete target Jenkins URL like 'http://server:8080/jenkins/'. If this option is specified, auto-discovery will be skipped
if [ ! -z "$JENKINS_MASTER" ]; then
    PARAMS="$PARAMS -master $JENKINS_MASTER"
fi

# Number of executors - One executor per Docker container
PARAMS="$PARAMS -executors 1 -username jenkins -password jenkins"

java -jar $HOME/swarm-client-jar-with-dependencies.jar $PARAMS -fsroot $HOME
