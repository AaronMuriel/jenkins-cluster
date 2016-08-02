# Jenkins Cluster

Jenkins Cluster Using Docker

## Jenkins Master ##

Based on the official Jenkins Docker Image version 2.7.1.

There are no executors in this node.

The following plugins are installed automatically:

- swarm:2.2
- job-dsl:1.48
- jobConfigHistory:2.15
- nested-view:1.14
- credentials:2.1.4
- greenballs:1.14
- claim:2.8
- ci-game:1.25
- emotional-jenkins-plugin:1.2
- git:2.5.2
- clone-workspace-scm:0.6
- multiple-scms:0.6
- gradle:1.25
- ivy:1.26
- checkstyle:3.46
- pmd:3.45
- findbugs:4.65
- jacoco:2.0.1
- cobertura:1.9.8
- tasks:4.49

## Jenkins Slaves ##

Ubuntu Trusty (14.04) slaves with the following tools installed:

- Java JDK 8 update 101
- Maven 3.3.9
- Ant 1.9.7

## Run Jenkins Cluster ##

To start a Jenkins cluster run this command.

    docker-compose --file jenkins-cluster.yml up -d

## List Containers ##

Use this command to lsit the containers that the previous command has started.
    
    docker-compose ps

## Scaling Jenkins Slaves ##

To scale slave service:

    docker-compose scale slave=5
    
After that command you should see five slaves connected to Jenkins.