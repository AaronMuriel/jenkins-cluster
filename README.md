# Jenkins Cluster

Jenkins Cluster Using Docker

## Jenkins Master ##

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
- subversion:2.6
- clone-workspace-scm:0.6
- multiple-scms:0.6
- ant:1.3
- maven-plugin:2.13
- gradle:1.25
- ivy:1.26
- checkstyle:3.46
- pmd:3.45
- findbugs:4.65
- jacoco:2.0.1
- cobertura:1.9.8
- tasks:4.49
- junit:1.15
- javadoc:1.4
- windows-slaves:1.1

### Start Master Jenkins ###

    docker build -t jenkins-master jenkins-master/
    docker run -d --name jenkins -p 8080:8080 jenkins-master -d

## Jenkins Slaves ##

Ubuntu Trusty (14.04) slaves with the following tools installed:

- Java JDK 8 update 101
- Maven 3.3.9
- Ant 1.9.7

### Start Jenkins Slaves ###

Build the Docker Images for Jenkins Slave

    docker build -t jenkins-slave jenkins-slave/

If Jenkins Master is running in another server, point the slave to that server.

    docker run -d jenkins-slave -master http://<JENKINS_MASTER_ADDRESS>:8080

If the Jenkins Slave container will run in the same server than Jenkins Master container, just link them.

    docker run -d --link jenkins:jenkins jenkins-slave

## List Containers ##

Use this command to list running containers

    docker ps
