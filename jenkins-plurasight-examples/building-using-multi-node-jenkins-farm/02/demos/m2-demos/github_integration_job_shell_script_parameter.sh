#!/bin/bash

echo ""
echo "----------- EXECUTE SHELL -----------"
echo "Build triggered via GitHub Web Hook ..."

# Build WAR file
mvn clean prepare-package war:war
