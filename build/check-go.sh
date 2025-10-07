#!/bin/bash

version_json=$(curl https://go.dev/dl/?mode=json)
parsed_version=$(echo "${version_json}" | jq -r '.[].version' | grep "${GOVERSION%.*}")

if [[ -z "${parsed_version}" ]]; then
    echo "INFO: Go ${GOVERSION} is no longer supported."
elif [[ ${parsed_version} != "go${GOVERSION}" ]]; then
    echo "ERROR: Found Go version '${GOVERSION}', but it's not the latest. Set to GOVERSION to '${parsed_version#go}'."
    exit 1
fi
