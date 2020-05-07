# Releasing Your Project

Your project is completed and ready to be published? The Next Skeleton is here for you, too!

As a first step, you should clean your project, just to make sure there are no old and unwanted files in the release later.

```
ant clean
```

Now you can build the release.

```
ant release
```

It assembles all the files for your project. If it was successful, you will find a choice of release files in your `dist` directory:

* `dist/package/`: This directory contains all the files that need to be released. You can copy it to the SD card of the ZX Spectrum Next, or compress it for publication.

* `dist/helloworld.zip`: For your convenience, there is a zip file that is ready to be uploaded somewhere. Your users just need to unpack it into a directory on the SD card of their ZX Spectrum Next.

* `dist/image.mmc`: This image can be copied to an SD card via `dd`. When inserted into a ZX Spectrum Next, it will immediately start your project. This is useful if you intend to distribute your project on SD cards.

* `dist/helloworld.nxt`: If your project only consists of this single file, you can just distribute the `.nxt` file itself of course.

Instead of `helloworld` files, you will see `.zip` and `.nxt` having your project's name, of course.