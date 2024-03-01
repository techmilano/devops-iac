# Display help menu with Jenkins CLI
java -jar jenkins-cli.jar -s http://<jenkins_server_URL_or_IP_address>:8080/ -webSocket help 

# Install the Matrix Authentication plug-in with Username/password authentication
java -jar jenkins-cli.jar -s http://<jenkins_server_URL_or_IP_address>:8080/ -auth "<username>:<password>" install-plugin http://updates.jenkins-ci.org/download/plugins/matrix-auth/2.6/matrix-auth.hpi