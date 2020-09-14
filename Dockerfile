FROM rocker/tidyverse:3.6.3

ADD setup.sh /tmp/setup.sh
ADD scripts/ /home/rstudio/scripts
RUN \
  mkdir -p /home/rstudio/workspace && \
  chown -R rstudio:rstudio /home/rstudio/workspace && \
  bash /tmp/setup.sh
