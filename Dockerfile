FROM rocker/tidyverse:3.6.3

ADD setup.sh /tmp/setup.sh
ADD scripts/ /home/rstudio/scripts
RUN bash /tmp/setup.sh
