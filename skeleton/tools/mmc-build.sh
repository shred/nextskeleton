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
# Creates a new MMC image from the given base image.
# Requires mtools and sfdisk.
#
# Usage: mmc-build.sh <baseimg> <target> <size>
#   baseimg: Directory where the base image is located at
#   target: File name of the image mmc file to be generated
#   size: Size of the MMC, e.g "1G" for 1 GByte
#

set -eu

BASEIMAGE="$1"
TARGET="$2"
SIZE="$3"

if [ -z "$(command -v mcopy)" ]; then
    echo "Please install mtools"
    exit 1
fi

rm -f "$TARGET"
truncate -s "$SIZE" "$TARGET"
echo 'type=6' | sfdisk --quiet "$TARGET"
mformat -i "$TARGET"@@1M -v SPECNEXT -F
mcopy -spm -i "$TARGET"@@1M "$BASEIMAGE"/* ::
echo "Created a fresh image at $TARGET"
