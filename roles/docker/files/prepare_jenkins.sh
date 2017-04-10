#!/bin/bash
#######################
#
# Prepare Jenkins

user=jenkins
group=jenkins
import_script="$(dirname "$0")/install_plugin.sh"
import_file=${1:-Missing import text file}

if [[ ! -x ${import_script} ]] ; then
  echo "Missing component: ${import_script}"
  exit 2
fi

if [[ ! -r ${import_file} ]] ; then
  echo "Missing component: ${import_file}"
  exit 2
fi



awk -F'.' '{print $1}' ${import_file} | while read plugin
do
  ${import_script} ${plugin}
done
