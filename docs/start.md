# Quick Start

If you haven't done yet, [install all the necessary tools](/#requirements) first.

## Your First Project

Open a terminal and change to the directory where your copy of The Next Skeleton is located. There is a tool called `nxtsetup` that will create a skeleton for your project. Just invoke it, passing the target directory and your project name as parameters. Say we want to create a project called "helloworld" in the "projects" directory of your home directory:

```
./nxtsetup --dir ~/projects helloworld
cd ~/projects/helloworld
```

That's all! Your project is ready to be started. Just type:

```
ant run
```

It will take a while at the first time, so please be a little patient.

After a couple of seconds, an emulator window appears, and your program is started automatically. You should see a black window now, and a famous text that reads:

```
Hello World!
```

Congratulations! With three commands only, you have created a new project, assembled it, and started it on a ZX Spectrum Next emulator.

You can now close the emulator window. Open the `src/helloworld.asm` file in your favourite editor, and change it a bit (just change the message text if you're worried to break something). After that, invoke `ant run` again. This time, the emulator starts almost instantly, and is showing your change.

Basically, that's all you need to know. You can now start to modify the `helloworld.nex` file, add other files, and experiment with the setup.

As soon as you want to know more about the how the skeleton works, have a look at the text below, and read the other chapters of this documentation.

## Project Structure

The tool has created a project skeleton at `~/projects/helloworld`. Let's have a look at the files in this directory:

* `src/helloworld.asm` – This is a simple assembler program. It serves as a starting point for your own project. It is expected to have the same name as your project, followed by an `.asm` suffix. Do not rename or delete this file, otherwise your project cannot be built any more.

* `resources/readme.txt` – The `resources` directory contains static files that are supposed to be copied to the SD card. This `readme.txt` is just an example file. You can safely delete it, or the entire directory, if you won't need it.

* `build.xml` – This is the `ant` build file. It contains all the steps that need to be done in order to assemble and run your program.

* `tools/` – This directory contains some helper tools for building the project. You can ignore it, as you won't have to change the files in there anyway. However, you must not delete this directory, otherwise your project cannot be built any more.

* `dist/` – This directory wasn't there when you created the project, but was created when you ran `ant`. It contains all the files that are made when you build your project. You can safely delete this directory if you want to. `ant` will then recreate it on the next run.

* `.image/` – This directory has been created by `ant` as well. It contains an unpacked version of the ZX Spectrum Next distribution. You can delete this directory at any time. If `ant` finds it missing, it will download and unpack the distribution again. However, do not change anything in this directory, as the changes are not permanent and may become reverted.
 
* `.gitignore` – This file keeps [git](https://git-scm.com/) from adding the `dist` and `.image` directories. Their content is generated and consume a lot of space, so there is no need (and no real purpose) to commit them to an SCM. If you won't use git, you can delete this file.

## Behind the Curtain

In the background, `ant` did a lot of work for you. The `build.xml` file contains all the steps that are necessary to manage your project. They are called _targets_. `run` is such a target. It depends on other targets to be executed before. `ant` takes care for that, too.

This is what `ant` actually did when you invoked it for the first time:

* It found out that the `.image` directory was missing, so it downloaded an official distribution file from [zxspectrumnext.online](http://www.zxspectrumnext.online), created the `.image` directory, and unpacked the distribution there. These files are necessary for creating an MMC image, and for running the #CSpect emulator. There is no need for you to take care of that, though. `ant` does all the heavy lifting.

* It found out that the `dist` directory was missing, so it was created.

* It assembled the `src/helloworld.asm` file. The assembler created a file `helloworld.nex` that was written into the `dist` directory. This is your program! You could copy this `.nex` file to your ZX Spectum Next's SD card and run it on the real machine.

* It found out that there was no MMC image file yet, so it created a file `dist/image.mmc`, formatted it, and copied the contents of the `.image` directory to it. This `dist/image.mmc` file is used by the emulator later. If you delete it, `ant` will create a new one.

* As a preparation, `ant` made a directory `helloworld` on the freshly created MMC image. It then copied your program and all the files in the `resources` directory to that directory.

* Finally, the emulator was started. `ant` generated an `autoexec.bas` file that immediately loads your program as soon as the Spectrum Next has booted up. Then the #CSpect emulator was started, using the `dist/image.mmc` file as MMC image.

So a lot of things have happened automatically after you typed `ant run` for the first time.

If you invoke `ant run` again, it finds the `.image` directory to be present, so it will only need to invoke the assembler, and then immediately start the emulator. This is why the first run is taking a lot of time, while the subsequent runs are much faster.
