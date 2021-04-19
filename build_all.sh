#!/bin/bash
# Copies all templates and builds the tags
CURRENT_DIR=$(pwd)

source "${CURRENT_DIR}/update.sh"

source "${CURRENT_DIR}/variables.sh"

for drupal_version in "${drupal_versions[@]}"
do
  variable_name="drupal_php_matrix$drupal_version"
  php_versions=(`echo ${!variable_name} | tr ';' ' '`)
  for php_version in "${php_versions[@]}"
  do
    TAG_PREFIX="${drupal_version}${php_version}"
    echo [RUN] Build "drupalci:${drupal_version}${php_version}apache" \
      && clear \
      && cd "${CURRENT_DIR}/${drupal_version}/apache" \
      && docker build -t "dennisdigital/drupalci:${TAG_PREFIX}apache" . --build-arg "DRUPAL_IMAGE=drupal:${TAG_PREFIX}apache" \
      && cd "${CURRENT_DIR}"

    echo [RUN] Build "drupalci:${TAG_PREFIX}-apache-interactive" \
      && clear \
      && cd "${CURRENT_DIR}/${drupal_version}/apache-interactive" \
      && docker build -t "dennisdigital/drupalci:${TAG_PREFIX}apache-interactive" . --build-arg "DRUPAL_IMAGE=drupal:${TAG_PREFIX}apache" \
      && cd "${CURRENT_DIR}"
  done
done
