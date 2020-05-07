# The Next Skeleton

This is a skeleton generator for Sinclair ZX Spectrum Next projects.

It is targeted for Linux systems, but might also work on MacOS and Windows with some modifications.

## Features

* Start your ZX Spectrum Next assembler project with just a single command.
* Provides an assembler source file that serves as a starting point for your own development.
* An `ant` script does all the work of assembling your project, setting up an MMC image file, and starting the emulator.
* The project structure is prepared for SCM tools like git or Subversion. A `.gitignore` file is already included in your project.
* The MMC image is created as a sparse file, to save your harddisk space. (If supported by the underlying file system.)

## Requirements

The Next Skeleton requires these tools to be installed on your system: [`ant`](https://ant.apache.org/), `curl`, `mono`, `mtools`, `python3`, [sjasmplus](https://github.com/z00m128/sjasmplus), and [#CSpect](http://dailly.blogspot.com/).

Please read the documentation about how to set up your system.

## Documentation

Read the documentation [online](https://shredzone.org/docs/nextskeleton/index.html).

You can also find the documentation in the [docs](docs/) directory of this project.

## Contribute

* Fork the [Source code at GitHub](https://github.com/shred/nextskeleton). Feel free to send pull requests.
* Found a bug? [File a bug report](https://github.com/shred/nextskeleton/issues) for bugs related to the skeleton. Issues with the assembler or emulator should be reported at the respective project.

## Licence

_The Next Skeleton_ is open source software. The source code is available [at GitHub](https://github.com/shred/nextskeleton), and is distributed under the terms of [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0).

This licence does not apply to projects that were generated by this skeleton tool.