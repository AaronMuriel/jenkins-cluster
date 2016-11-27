# Jenkins Master Server #

This is the Jenkins master node. There are no executors in this node, so you need to attach one or more slaves to run the jobs.

## Start Master Jenkins ##

Create a folder to store Jenkins data files, so the container can be reseted without losing information.  
   
    mkdir ~/jenkins_data
    chmod 777 ~/jenkins_data
    
Build the Docker Image  
    
    docker build -t jenkins-master jenkins-master
    
Run the container  
    
    docker run -d --name jenkins --restart=always -p 8080:8080 -p 50000:50000 -v ~/jenkins_data:/var/jenkins_home jenkins-master 

## Adding jobs by default ##

In order to have Jenkins jobs automatically configured when you run the container, follow these steps:  

1. Inside the jobs folder (jenkins-master/jobs) add a new folder named with the name of the new job.  
2. Inside the folder created in the previous step, add a new file named config.xml. That file should contain all the configuration of new job.

# Development and Building Environment #

The purpose of the following images is to minimize the differences between development and building environments to ensure developers use the same tools that Jenkins Slaves will use to validate their code.

## Base Environment ##

The base environment will be based in Ubuntu Xenial (16.04) and will count with the following tools:

- Java JDK 8 update 101
- Maven 3.3.9
- Ant 1.9.7
- Python 2.7.12
- Python PIP 8.1.2

To build this image run the command:  

    docker build -t base-environment base-environment/

## Jenkins Linux Slaves ##

All Jenkins Slaves will be based in the Base Environment and you can build the Docker Image with the following command:  

    docker build -t jenkins-slave jenkins-slave/

The slave will be labeled "ubuntu-slave".

### Start Jenkins Slaves ###

Create a folder to store slave files so you can keep them even if the container is restarted.  
    
    mkdir ~/jenkins_slave_data
    chmod 777 ~/jenkins_slave_data

Build the Docker Image

    docker build -t jenkins-slave jenkins-slave/

Run the Jenkins Slave, you need to provide Jenkins Master URL and the number of executors this slave should have.  

    docker run -d --restart=always -v ~/jenkins_slave_data:/home/jenkins-slave/workspace jenkins-slave -master http://${JENKINS_MASTER_ADDRESS}:8080 -executors <NUMBER_OF_EXECUTORS>

## IntelliJ IDEA Development Environment ##

Using the same image as parent than Jenkins Slaves, you can guarantee that the tools in development environment and building environment are the same.

To build the IntelliJ IDEA development environment you should run:  

    docker build -t intellij-dev-environment intellij-dev-environment/
    
Then, you can start IntelliJ IDEA by running:  

    docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v <REPOS_DIR>:/workspace intellij-dev-environment

Where <REPOS_DIR> is the directory in the host computer where you have the source code you are working on.
