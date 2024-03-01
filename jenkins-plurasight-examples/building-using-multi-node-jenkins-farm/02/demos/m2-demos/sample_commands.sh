  # Get Jenkins initial admin security password
  sudo cat /var/lib/jenkins/secrets/initialAdminPassword

  # Forward port 80 to port 8080 with IP Tables
  sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

  # NOT NEEDED but provided as an example together with the instruction above
  sudo iptables -A INPUT -p tcp -m tcp --sport 80 -j ACCEPT
  sudo iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT

  # /etc/sysconfig/jenkins - here you can change the port number by setting JENKINS_PORT to the desired vlue

# Plugin updates URL
# http://updates.jenkins-ci.org/download/plugins/matrix-auth/

