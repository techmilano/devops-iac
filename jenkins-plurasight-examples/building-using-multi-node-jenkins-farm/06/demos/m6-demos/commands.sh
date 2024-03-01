# URL to trigger a Jenkins job remotely - values were replaced as per the template demostrated in the corresponding clip
http://ec2-184-73-30-154.compute-1.amazonaws.com:8080/job/SampleMicroServiceBuild/build?token=8739182347823493263487629


# Install Node and NPM
brew update
brew install node

# Verify Node and NPM install
node -v
npm -v

# Install Newman and reporting add-ons globally
# newman-reporter-html - basic report for developers and other technical stakeholders
# newman-reporter-htmlextra - color-coded report that can also be shared with business stakeholders
npm install -g newman newman-reporter-html newman-reporter-htmlextra

# Generate HTML report with Newman from previously exported Postman collection
newman run Jenkins1.json -r htmlextra