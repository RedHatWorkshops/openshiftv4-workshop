#!/bin/bash

git add .
git commit -am "$(curl -s http://whatthecommit.com/index.txt 2>&1)"
git push
oc delete all --all -n labs
oc new-app --name=guide samueltauil/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master" -e WORKSHOPS_URLS="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master/_module_groups.yml"
oc new-app --name=guide osevg/workshopper -e CONTENT_URL_PREFIX="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master" -e WORKSHOPS_URLS="https://raw.githubusercontent.com/RedHatWorkshops/openshiftv4-workshop/master/_module_groups.yml"
