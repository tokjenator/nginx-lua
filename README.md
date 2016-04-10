
# NGINX+Lua example project: A simple image server with scaling functionality

## Dependencies
* Docker

## How to use

First, you will need to build a Docker image based on OpenResty, with additional libraries for image transformation (ImageMagick [SIC]).
This will download a Debian based image from DockerHub, which will be around 300 MB in size.
```
$ ./build.sh
```

Now, run the docker image. This will start an nginx server on port 8999.
```
$ ./dev_run.sh
```

Open a web browser, and go to [http://localhost:8999/images-lua-cached/testimage](http://localhost:8999/images-lua-cached/testimage)

The web page accepts the following URL parameters:
* width=XX -- sets the width of the image. If no height argument is set, height will be scaled proportionally.
* height=XX -- sets the height of theimage. If no width argument  is set, width will be scaled proportionally.
* blur=XX,YY -- blurs the image with sigma=XX and radius=YY.

