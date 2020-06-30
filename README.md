> Docker image that builds on rocker/tidyverse and adds conda

The image is pretty heavy at ~5GB but it does what we need.

It might be a good idea to have the rstudio-server run *inside* the conda env,
or it might not. Still need to investigate that.

# Build it

```bash
docker build -t ternandsparrow/rstudio-server-conda:$(git rev-parse --short HEAD) .
```

# Run it

```bash
docker run \
  -e PASSWORD=somepassword \
  -d \
  --name rstudio \
  -p 8787:8787 \
  -v my-data:/home/rstudio \
  --restart unless-stopped \
  ternandsparrow/rstudio-server-conda:$(git rev-parse --short HEAD)
```
