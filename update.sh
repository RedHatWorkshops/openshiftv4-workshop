#!/bin/bash

git add .
git commit -am "$(curl -s http://whatthecommit.com/index.txt 2>&1)"
git push
oc delete all --all -n labs
oc new-app --name=guide samueltauil/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master" -e WORKSHOPS_URLS="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master/_module_groups.yml"

oc new-app --name=cicd-lab osevg/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master" -e WORKSHOPS_URLS="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master/_module_groups.yml"
#use this for 4.2
oc new-app --name=workshop osevg/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/ocp4.2" -e WORKSHOPS_URLS="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/ocp4.2/_module_groups.yml"


