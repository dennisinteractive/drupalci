#!/bin/bash
# Copies all templates and builds the tags
CURRENT_DIR=$(pwd)

source "${CURRENT_DIR}/build_all.sh"

source "${CURRENT_DIR}/variables.sh"
for drupal_version in "${drupal_versions[@]}"
do
  variable_name="drupal_php_matrix$drupal_version"
  php_versions=(`echo ${!variable_name} | tr ';' ' '`)
  for php_version in "${php_versions[@]}"
  do
    TAG_PREFIX="${drupal_version}${php_version}"
    cd "${CURRENT_DIR}/${drupal_version}/apache" \
      && docker push "dennisdigital/drupalci:${TAG_PREFIX}apache" \
      && cd "${CURRENT_DIR}"

    cd "${CURRENT_DIR}/${drupal_version}/apache-interactive" \
      && docker push "dennisdigital/drupalci:${TAG_PREFIX}apache-interactive" \
      && cd "${CURRENT_DIR}"
  done
done