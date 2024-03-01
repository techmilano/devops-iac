# Open /etc/ssh/sshd_config as root
vi /etc/ssh/sshd_config

# Uncomment PasswordAuthentication yes
# Save and exit

# Restart sshd service
systemctl restart sshd.service