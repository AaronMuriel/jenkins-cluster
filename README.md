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

# Jenkins Slaves #

Jenkins Slaves are build from an Ubuntu Xenial base and have this tools by default:  
- Java JDK 8 update 121
- Maven 3.3.9
- Ant 1.10.1
- Python 2.7.12
- Python PIP 8.1.2

You can build the Docker Image with the following command:  

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

# Work in progress #

Another approach is to have predefined images representing different build environments and make Jenkins automatically start the required environment to build and destroy it after.
