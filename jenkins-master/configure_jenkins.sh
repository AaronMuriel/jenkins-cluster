#!/usr/bin/env bash

ip=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)


DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir /var/jenkins_home/
mkdir /var/jenkins_home/config-history
mkdir /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration
mkdir /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE

echo "<?xml version='1.0' encoding='UTF-8'?>" > /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE/jenkins.model.JenkinsLocationConfiguration.xml
echo "<jenkins.model.JenkinsLocationConfiguration>" >> /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE/jenkins.model.JenkinsLocationConfiguration.xml
echo "  <adminAddress>address not configured yet &lt;nobody@nowhere&gt;</adminAddress>" >> /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE/jenkins.model.JenkinsLocationConfiguration.xml
echo "  <jenkinsUrl>http://$ip:8080/</jenkinsUrl>" >> /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE/jenkins.model.JenkinsLocationConfiguration.xml
echo "</jenkins.model.JenkinsLocationConfiguration>" >> /var/jenkins_home/config-history/jenkins.model.JenkinsLocationConfiguration/$DATE/jenkins.model.JenkinsLocationConfiguration.xml

