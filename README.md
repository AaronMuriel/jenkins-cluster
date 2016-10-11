# Jenkins Cluster

Jenkins Cluster Using Docker

## Jenkins Master ##

This is the Jenkins master node. There are no executors in this node, so you need to attach one or more slaves to run the jobs.

### Start Master Jenkins ###

Create a folder to store Jenkins data files, so the container can be reseted without losing information.  
   
    mkdir ~/jenkins_data
    chmod 777 ~/jenkins_data
    
Build the Docker Image  
    
    docker build -t jenkins-master jenkins-master/
    
Run the container  
    
    docker run -d --name jenkins --restart=always -p 8080:8080 -p 50000:50000 -v ~/jenkins_data:/var/jenkins_home jenkins-master 

## Jenkins Linux Slaves ##

Jenkins Linux slaves are based in Ubuntu Xenial (16.04) with the following tools installed by default:

- Java JDK 8 update 101
- Maven 3.3.9
- Ant 1.9.7
- Python 2.7.12
- Python PIP 8.1.2

The slave will be labeled "ubuntu-slave".

### Start Jenkins Slaves ###

Create a folder to store slave files so you can keep them even if the container is restarted.  
    
    mkdir ~/jenkins_slave_data
    chmod 777 ~/jenkins_slave_data

Build the Docker Image

    docker build -t jenkins-slave jenkins-slave/

Run the Jenkins Slave, you need to provide Jenkins Master URL and the number of executors this slave should have.  

    docker run -d --restart=always -v ~/jenkins_slave_data:/home/jenkins-slave/workspace jenkins-slave -master http://${JENKINS_MASTER_ADDRESS}:8080 -executors <NUMBER_OF_EXECUTORS>
