> Docker image that builds on rocker/tidyverse and adds conda

The image is pretty heavy at ~5GB but it does what we need.

It might be a good idea to have the rstudio-server run *inside* the conda env,
or it might not. Still need to investigate that.

# Build it

```bash
./build.sh
```

# Run it
Check what tags are available:
```bash
docker images
```

Let's assume that we'll use the tag `20200730.15cce32`.
```bash
docker run \
  -e PASSWORD=somepassword \
  -d \
  --name rstudio \
  -p 8787:8787 \
  -v my-data:/home/rstudio/workspace \
  -v rstudio-kitematic:/home/rstudio/kitematic \
  --restart unless-stopped \
  ternandsparrow/rstudio-server-conda:20200730.abc123
```
