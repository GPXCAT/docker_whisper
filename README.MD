# build
```bash
docker build -t jscat/whisper .
```

# build multi platform
```bash
docker buildx build --platform linux/amd64,linux/arm64 -t jscat/whisper:latest --push .
```

# run
```bash
docker run --rm -it --gpus all \
    -v ~/.cache/whisper:/root/.cache/whisper \
    -v $(pwd):/app -w /app \
    jscat/whisper audio.wav --language Chinese
```

# install nvidia driver
```bash
sudo add-apt-repository ppa:graphics-drivers/ppa --yes
sudo apt update
sudo apt install -y nvidia-driver-530
sudo reboot
```

# install docker
https://docs.docker.com/engine/install/ubuntu/
```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

# install docker with gpu
```bash
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
      && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
      && curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
            sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
            sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo service docker restart
```

# test docker with gpu
```bash
docker run --rm --gpus all nvidia/cuda:12.1.1-base-ubuntu20.04 nvidia-smi
```

# document
https://github.com/openai/whisper