# A PoC Test of TWM on OpenShift


## Deploy to OpenShift

oc new-app php:8.2~https://github.com/vcschuni/twm-test.git --name=twm-test
oc expose service/twm-test
