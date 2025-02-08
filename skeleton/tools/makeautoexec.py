#!/usr/bin/env python3
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

import argparse
import struct
import sys

parser = argparse.ArgumentParser(description='Generate an autoexec.bas that launches a .nex file')
parser.add_argument('nex',
            help='path of the .nex file to be launched')
parser.add_argument('file',
            help='autoexec.bas file to be generated')
args = parser.parse_args()

command = '.nexload ' + args.nex + '\r'

contents = bytearray(128)
contents[0:8]   = 'PLUS3DOS'.encode('ASCII')        # +3DOS signature
contents[8]     = 0x1A
contents[9:11]  = [0x01, 0x00]                      # Issue and Version

contents += bytearray((0x00, 0x0A))                 # Line number 10
contents += struct.pack('<H', len(command))         # Line length
contents += command.encode('ASCII')                 # BASIC line
programLength = len(contents) - 128                 # Length of the BASIC program

contents[15]    = 0x00                              # DOS header: PROGRAM
contents[16:18] = struct.pack('<H', programLength)  # DOS header: length
contents[18:20] = struct.pack('<H', 10)             # DOS header: run at line 10
contents[20:22] = struct.pack('<H', programLength)  # DOS header: offset to prog
contents[11:15] = struct.pack('<L', len(contents))  # Set total length
contents[127]   = sum(contents[0:126]) & 0xFF       # Compute checksum

with open(args.file, 'wb') as f:
    f.write(contents)
