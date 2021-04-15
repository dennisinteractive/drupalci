#!/bin/bash
# This script copies the respective files into each folder

files_list=(
"README.md"
"templates/bootstrap.php"
"templates/entrypoint.sh"
"templates/php-overrides.ini"
"templates/__DRUPAL_VERSION__/runtests.php"
)
destination_template="./__DRUPAL_VERSION__/apache"

source "$(dirname $0)/variables.sh"

for drupal_version in "${drupal_versions[@]}"
do
  destination="${destination_template/__DRUPAL_VERSION__/$drupal_version}"
  for file in "${files_list[@]}"
  do
    cp "${file/__DRUPAL_VERSION__/$drupal_version}" "${destination}"
  done
done

#git status
