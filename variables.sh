#!/bin/bash

export drupal_versions=("7" "8" "9")
# Fallback to original docker image tag - "".
export drupal_php_matrix7="-;-php7.4-"
export drupal_php_matrix8="-;-php7.4-"
export drupal_php_matrix9="-;-php7.4-;-php8.0-"
