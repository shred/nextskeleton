#!/bin/bash
#
# nextskeleton - An assembler skeleton for the ZX Spectrum Next
#
# Copyright (C) 2020 Richard "Shred" Körber
#   https://codeberg.org/shred/nextskeleton
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# Syncs the image to the sdcard.
# Requires mtools.
#
# Usage: mmc-dist.sh <project> <package> <autoexec> <target>
#   project: project name
#   package: directory of the package containing all the deployment files
#   autoexec: an autoexec file for starting the project
#   target: File name of the image mmc file to sync with
#

set -eu

PROJECT="$1"
PACKAGEDIR="$2"
AUTOEXEC="$3"
TARGET="$4"

if [ -z "$(command -v mcopy)" ]; then
    echo "Please install mtools"
    exit 1
fi

mdeltree -i "$TARGET"@@1M ::"$PROJECT" | true
mcopy -spm -i "$TARGET"@@1M "$PACKAGEDIR" ::"$PROJECT"
mcopy -o -i "$TARGET"@@1M "$AUTOEXEC" ::nextzxos/
echo "Deployed project to $TARGET:$PROJECT"
