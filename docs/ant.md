# About ant

[`ant`](https://ant.apache.org/) is a rather old build tool. It was originally used to build Java projects, but because of many predefined [tasks](https://ant.apache.org/manual/tasksoverview.html) it can be used for much more. On the other hand, its XML configuration file `build.xml` is rather old-fashioned and looks overly complicated. However, it's a reliable tool that does its job, and does it well. If you want to dive deeper into it, you can read the [online documentation](https://ant.apache.org/manual/).

For the start, all you need to know is that ant is started with the command `ant`, which is followed by the name of the target you want to reach. You can even omit the target name to execute the default target called `package`.

## Targets

All the targets are defined in the `build.xml` file, but not all of them are useful for manual invocation. As your project grows, you might want to extend some of the targets, or create new targets that depend on existing ones.

These are the targets provided by the Next Skeleton (the **bold** printed ones are meant for manual invocation):

* `setup`: If the `.image` directory is missing, a distribution is downloaded and unpacked into a freshly created directory.
  
* `init`: Creates the `dist` directory if missing. If your project needs other essential initialization tasks, you can extend this target accordingly.

* `sdcard`: Generates the `dist/image.mmc` file if missing.

* `prepare`: This target is meant to prepare files that are necessary for the `build` target. For example, a PNG image could be converted to a ZX Spectrum bitmap here, in order to be included by the assembler.

* `build`: This target assembles the main file, which is called like your project with an `.asm` suffix. The main file is supposed to assemble code, include other code and binaries, and then generate at least one `.nex` file in the `dist/` directory. You can add further build steps here, and store the results in `dist/resources/`.

* **`package`**: Packages the project. It creates the `dist/package/` directory, builds everything, and then collects all the files that need to be put to the SD card.

* **`run`**: Runs the project in the #CSpect emulator.

* **`debug`**: Starts the project in debug mode. The `EXIT` and `BREAK` pseudo opcodes are enabled. The system is also marked as emulator in the SpecNext _Machine ID_ register (0x00).

* **`release`**: Releases the project. You will find a zip file in the `dist` directory that contains all the release files.

* **`clean`**: Deletes all generated files, by deleting the `dist` directory. Use this target for a fresh build of your project.

* **`purge`**: Like `clean`, but also deletes the `.image` directory. Your project is now in a state as if it was freshly checked out.

Remember that `ant` takes care for dependencies. You can just invoke any target, and `ant` makes sure that all required other targets are invoked before.

## Properties

If you open the `build.xml` file, you will find a few properties at the top.

* `distributionurl`: The URL of the distribution ZIP file. You can change this line when there is a newer distribution file available.
* `src`: The directory of your source files. Default is `src`.
* `tools`: The directory where build tools are located. Default is `tools`.
* `dist`: The directory for all generated files. Default is `dist`.
* `resources`: Static resources are found in this directory. Default is `resources`.
* `package`: The directory where your release package is assembled. Default is `${dist}/package`.
* `image`: The directory where the distribution image is unpacked. Default is `.image`.
* `sdcard`: The name of the MMC file. Default is `${dist}/image.mmc`.
* `sdsize`: The size of the MMC file. Default is `1G`.
* `baseasmfile`: The assembler file that is assembled by the `build` target. Default is `${ant.project.name}.asm`, which is your project name followed by an `.asm` suffix.
* `assembler`: Path to the sjasmplus assembler. The default is `sjasmplus`, so the assembler is expected to be found in your `PATH`.
* `emulator`: Path to the cspect emulator. The default is `cspect`, which is the bash script you was asked to create in the installation chapter.

Except of `distributionurl` and `sdsize`, it is very recommended to keep the default values unless you know what you are doing.
