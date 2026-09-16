#! /bin/bash

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)

version_json=$(curl -s --fail --show-error "https://go.dev/dl/?mode=json&include=all")

# Fix sed issues on mac by using GSED
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
SED="sed"
if [ "${OS}" == "darwin" ]; then
  SED="gsed"
  if [ ! -x "$(command -v ${SED})" ]; then
    echo "ERROR: ${SED} required, but not found."
    echo 'Perform "brew install gnu-sed" and try again.'
    exit 1
  fi
fi

if [[ -z "${version_json}" ]]; then
  echo "ERROR: Failed to fetch Go version JSON."
  exit 1
fi

for file in "${script_dir}"/../Dockerfile*; do
  echo "Checking Go version in $(basename "${file}")"
  existing_go_version=$(grep -oE "GOVERSION=[0-9]+\.[0-9]+\.[0-9]+" "${file}" | cut -d'=' -f2)
  existing_go_y=${existing_go_version%.*}
  latest_go_version=$(echo "${version_json}" | jq -r '.[] | select(.stable).version' | grep "^go${existing_go_y}" | sort --version-sort | tail -n 1)
  if [[ "go${existing_go_version}" == "${latest_go_version}" ]]; then
    echo "🟢 Go version is already up to date at ${existing_go_version}"
    continue
  fi
  latest_go_version=${latest_go_version#go}
  echo "🟡 Updating Go version from ${existing_go_version} to ${latest_go_version}"
  ${SED} -i "s/GOVERSION=${existing_go_version}/GOVERSION=${latest_go_version}/g" "${file}"
done

echo "INFO: Done updating Go versions."
exit 0
