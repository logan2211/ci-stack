# Copyright 2018, Logan Vig <logan2211@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export SCRIPT_PATH=$(dirname $(readlink -f "$0"))
export PROJECT_PATH=$(dirname "$SCRIPT_PATH")
export TESTS_PATH=${PROJECT_PATH}/tests
export FORKS=${FORKS:-$(grep -c ^processor /proc/cpuinfo)}
export ANSIBLE_PARAMETERS=${ANSIBLE_PARAMETERS:-""}
export ANSIBLE_FORCE_COLOR=${ANSIBLE_FORCE_COLOR:-true}

function bootstrap_roles {
  ROLES_REQUIREMENTS_FILE="${PROJECT_PATH}/ansible-role-requirements.yml"
  ROLES_PATH="${PROJECT_PATH}/playbooks/ephemeral_roles"
  ansible-galaxy install -f -i \
    -p "${ROLES_PATH}" \
    -r "${ROLES_REQUIREMENTS_FILE}"
}
