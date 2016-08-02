# Jenkins Cluster

Jenkins Cluster Using Docker

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