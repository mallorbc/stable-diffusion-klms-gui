FROM python:3.9


RUN apt-get update
RUN apt-get install -y --no-install-recommends software-properties-common
RUN apt-add-repository contrib
RUN apt-get update

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer
RUN fc-cache -f -v


RUN apt install git ffmpeg libsm6 libxext6 -y

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

RUN pip install albumentations==0.4.3 \
diffusers \
opencv-python \
pudb==2019.2 \
imageio==2.9.0 \
imageio-ffmpeg==0.4.2 \
omegaconf==2.1.1 \
test-tube>=0.7.5 \
streamlit>=0.73.1 \
einops==0.3.0 \
torch-fidelity==0.3.0 \
transformers==4.19.2 \
torchmetrics==0.6.0 \
kornia==0.6 \
pytorch-lightning==1.4.2 \
invisible-watermark \
gradio \
accelerate \
transformers \
pynvml==11.4.1 


RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers

RUN pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip

RUN pip install -e git+https://github.com/hlky/k-diffusion-sd#egg=k_diffusion

RUN pip install -e git+https://github.com/TencentARC/GFPGAN#egg=GFPGAN

RUN pip install -e git+https://github.com/xinntao/Real-ESRGAN#egg=realesrgan

RUN git clone https://github.com/mallorbc/stable-diffusion-klms-gui.git \
&& mv stable-diffusion-klms-gui /app


RUN cd /app \
&& pip install -e .

RUN mkdir -p /app/src/gfpgan/experiments/pretrained_models/
RUN mkdir -p /app/src/realesrgan/experiments/pretrained_models
RUN mkdir - /app/models/ldm/stable-diffusion-v1/

RUN wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth -O /app/src/gfpgan/experiments/pretrained_models/GFPGANv1.3.pth
RUN wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.1.0/RealESRGAN_x4plus.pth -O /app/src/realesrgan/experiments/pretrained_models/RealESRGAN_x4plus.pth
RUN wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.2.4/RealESRGAN_x4plus_anime_6B.pth -O /app/src/realesrgan/experiments/pretrained_models/RealESRGAN_x4plus_anime_6B.pth

WORKDIR /app

CMD [ "python", "scripts/web_gui.py" ]
