#!/usr/bin/env bash

CREGULAR='\033[1;37m'
CNAMESPACE='\033[1;35m'
CPOD='\033[1;34m'
NC='\033[0m'

echo -e "️🌊☁  ${CREGULAR}Welcome. You are now commanding the ${CNAMESPACE}$K8S_NAMESPACE${CREGULAR} drupal cloud via the ${CPOD}$HOSTNAME${CREGULAR} pod.${NC} 🌊☁️️"