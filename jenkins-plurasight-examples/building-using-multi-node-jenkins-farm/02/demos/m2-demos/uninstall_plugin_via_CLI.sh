#!/bin/bash

# SSH into Jenkins, then
cd $JENKINS_HOME/plugins        # usually /var/lib/jenkins/plugins
rm -fr <plugin_directory_name>  # e.g. matrix-auth
rm <plugin_name>.jpi            # e.g. matrix-auth.jpi