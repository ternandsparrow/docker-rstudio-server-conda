#!/bin/bash
set -euxo pipefail

apt update
apt install --assume-yes --no-install-recommends \
  gnupg \
  curl \
  apt-transport-https \
  gdal-bin \
  libgdal-dev

cd /tmp
# following steps from https://docs.conda.io/projects/conda/en/latest/user-guide/install/rpm-debian.html
curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg
install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg
rm conda.gpg
gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list
apt update
apt install --assume-yes --no-install-recommends conda

condaEnv=myenv
cat <<EOF | su -c bash rstudio
cd ~
source /opt/conda/etc/profile.d/conda.sh
conda create --yes --name $condaEnv

echo "source /opt/conda/etc/profile.d/conda.sh" >> .profile
echo "conda activate $condaEnv"                 >> .profile
echo "source .profile"                          >> .bashrc

# pre-install some stuff into our conda env
conda activate $condaEnv
conda install --yes gdal=3
EOF

# TODO look at making RStudio server run *in* the conda env, like https://github.com/grst/rstudio-server-conda
