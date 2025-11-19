# My PHP App for OpenShift

A PoC test for TWM

## Deploy to OpenShift

oc new-app php:8.2~https://github.com/YOUR_ORG/my-php-app.git --name=twm-test
oc expose service/twm-test
