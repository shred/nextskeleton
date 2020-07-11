# New Projects

As mentioned in the [quick start](start.md), the `nxtsetup` tool is creating a new project for you.

The only required parameter is your project name. It must only consist of ASCII letters and numbers. A few special characters (`_`, `-`, `+` and `.`) are also permitted except at the start of the name. The project name must not exceed 32 characters.

This project name will also be the name of your `.nex` file, and the directory on the SD card where your project can be found later.

```
./nxtsetup my-project
```

If you invoke `nxtsetup` like that, it creates a new project in the current working directory.

There are a few options to change your initial project setup:

* `-s`, `--size`: The size of the MMC image file to be created. Default is 1 GByte, which is plenty of space for the ZX Spectrum Next. You can choose other sizes like `512M`, `1G`, `2G`. The image is created as a [sparse file](https://en.wikipedia.org/wiki/Sparse_file) (if permitted by the underlying file system), so empty blocks are not consuming space on your harddisk. Be careful when copying the `dist/image.mmc` file, as the copy may allocate the actual file size on the target disk.

* `-u`, `--url`: The URL of the ZX Spectrum Next distribution to be used. It must be a ZIP file. You will find the latest version at [the official ZX Spectrum Next website](https://www.specnext.com/latestdistro/). Just copy the link to the **System/Next distribution LITE VERSION** (zip format). Do not use the board-backers version. If you are unsure, just skip this option and use the default.

* `-d`, `--dir`: The directory where the project is created. If omitted, the current working directory is used.

