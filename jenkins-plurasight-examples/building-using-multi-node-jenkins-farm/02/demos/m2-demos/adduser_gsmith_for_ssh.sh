# Log in as root from the AWS console SSH client: 
# Action > Connect > EC2 Instance Connect (browser-based SSH connection)


# Add user
adduser gsmith
sudo su - gsmith

# Set up .ssh folder 
mkdir .ssh && chmod 700 .ssh && cd ssh

# Generate SSH keys and set permissions
ssh-keygen -q -N ""
chmod 600 id_rsa && chmod 6oo id_rsa.pub

# Create authorized_keys and set permissions
touch authorized_keys && chmod 600 authorized_keys
