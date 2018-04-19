#!/usr/bin/env bash

set -e
set -o xtrace
DEBIAN_FRONTEND=noninteractive

#sudo rm /etc/apt/apt.conf.d/*.*
#sudo apt update
#sudo apt install unzip -y
#sudo apt -y upgrade --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
#sudo apt -y autoremove
#sudo ufw allow 8888:8898/tcp
#sudo apt -y install --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" qtdeclarative5-dev qml-module-qtquick-controls
#sudo add-apt-repository ppa:graphics-drivers/ppa -y
#sudo apt update
mkdir -p downloads
cd ~/downloads/
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_9.0.176-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
sudo apt update
sudo apt install cuda-9-0 -y
#wget http://files.fast.ai/files/cudnn-9.1-linux-x64-v7.tgz
wget https://s3.amazonaws.com/open-source-william-falcon/cudnn-9.0-linux-x64-v7.1.tgz
tar -xzvf cudnn-9.0-linux-x64-v7.1.tgz  
#tar xf cudnn-9.1-linux-x64-v7.tgz
sudo cp cuda/include/*.* /usr/local/cuda/include/
sudo cp cuda/lib64/*.* /usr/local/cuda/lib64/
#wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
#bash Anaconda3-5.0.1-Linux-x86_64.sh -b
cd 
mkdir -p tensorflow
cd tensorflow/
echo 'export PATH=~/anaconda3/bin:$PATH' >> ~/.bashrc
export PATH=~/anaconda3/bin:$PATH
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64"'
echo 'export CUDA_HOME=/usr/local/cuda'
source ~/.bashrc
#conda env update
echo 'source activate tensorflow' >> ~/.bashrc
source activate tensorflow
source ~/.bashrc
#pip install ipywidgets
#jupyter nbextension enable --py widgetsnbextension --sys-prefix
echo
echo ---
echo - YOU NEED TO REBOOT YOUR PAPERSPACE COMPUTER NOW
echo ---

