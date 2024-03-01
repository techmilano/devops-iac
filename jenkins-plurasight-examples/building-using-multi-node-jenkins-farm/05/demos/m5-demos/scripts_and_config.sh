# Install NFS utilities
yum install nfs-utils -y

# Open fstab
sudo vi /etc/fstab

# Mount EFS share
us-east-1a.fs-f8d1697b.efs.us-east-1.amazonaws.com:/    /var/lib/jenkins/jobs   nfs defaults    0    0

# Manual mount commands
sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-f8d1697b.efs.us-east-1.amazonaws.com:/ efs
mount -t nfs fs-f8d1697b.efs.us-east-1.amazonaws.com:/ /mnt/test

# Stop Jenkins
sudo systemctl stop jenkins.service

# Check mounted volume
df -h

# Change ownership of jobs folder
sudo chown -R jenkins:jenkins /var/lib/jenkins/jobs
ls -l /var/lib/jenkins/jobs

# Restart or start Jenkins service
sudo systemctl start jenkins.service
sudo systemctl restart jenkins.service

# Check status
systemctl status jenkins.service

# Check if builds folder is available on EFS share
ls -l /var/lib/jenkins/jobs/Test-HA

# Create sync script
sudo vi /opt/sync_passive_jenkins_with_master.sh

# Help and Reload Configuration
ssh -l gsmith -i ~/.ssh/aws/ec2/slave_rsa -p 53802 ec2-3-82-125-219.compute-1.amazonaws.com help
ssh -l gsmith -i ~/.ssh/aws/ec2/slave_rsa -p 53802 ec2-3-82-125-219.compute-1.amazonaws.com reload-configuration

# Schedule crontab
sudo vi /etc/cron.d/reload_jenkins_config

# Cron expression in reload_jenkins_config
*/2 * * * * root /bin/bash /opt/sync_passive_jenkins_with_master.sh

# Install HAProxy and configure it
sudo yum install haproxy -y
sudo vi /etc/haproxy/haproxy.cfg

# Truncate (clear) contents of haproxy.cfg
:1,$d

# /etc/haproxy/haproxy.cfg - new configuration that you need to enter
defaults
    log global
    maxconn 2000
    mode http
    option redispatch
    option forwardfor
    option http-server-close
    retries 3
    timeout queue 1m
    timeout connect 10s
    timeout client 1m
    timeout server 1m
    timeout check 10s

frontend ha_jenkins_endpoint
    bind *:80
    default_backend jenkins_masters_backend
    reqadd X-Forwarded-Proto:\ http
    
backend jenkins_masters_backend
    server jenkinsmaster1 172.31.83.184:8080 check
    server jenkinsmaster2 172.31.93.93:8080 check backup

# Manual backup of jobs folder
tar cvzf master-node-jobs-2020-06-01.tar.gz /var/lib/jenkins/jobs

# Sample backup crontab
*3 * * * * root tar cvzf master-`date +%Y-%m-%d`.tar.gz /var/lib/jenkins/jobs