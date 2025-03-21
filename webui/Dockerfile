# 使用阿里云预装CUDA 12.4和PyTorch的基础镜像
FROM egs-registry.cn-hangzhou.cr.aliyuncs.com/egs/sd-webui:4.3.9-full-pytorch2.1.2-ubuntu22.04


LABEL maintainer="renyun"
WORKDIR /workspace/stable-diffusion-webui
# 设置APT镜像源（阿里云源）
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y --no-install-recommends git ffmpeg libgl1 aria2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
#RUN /workspace/miniconda/bin/pip uninstall mediapipe -y &&  \
#    /workspace/miniconda/bin/pip install PyExecJS boto3 aliyun-python-sdk-core aliyun-python-sdk-alimt pyarrow>=4.0 --force

RUN rm -rf /workspace/stable-diffusion-webui/
WORKDIR /workspace
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
WORKDIR /workspace/stable-diffusion-webui
RUN pip install -r requirements.txt

COPY download_extension.sh /workspace/stable-diffusion-webui/
RUN chmod +x /workspace/stable-diffusion-webui/download_extension.sh && \
    /workspace/stable-diffusion-webui/download_extension.sh


CMD ["python", "-u", "./launch.py", "--ckpt-dir", "./ckpts", "--listen", "--port", "7680", "--enable-insecure-extension-access", \
"--disable-safe-unpickle", "--api", "--xformers", "--skip-install"]
