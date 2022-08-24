FROM python:3.9

ENV GRADIO_SERVER_PORT 7860

RUN apt update -y \
&& apt upgrade -y

RUN apt install git -y

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
invisible-watermark \
gradio \
accelerate \
transformers

RUN pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers

RUN pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip

RUN pip install -e git+https://github.com/hlky/k-diffusion-sd#egg=k_diffusion

RUN pip install -e git+https://github.com/TencentARC/GFPGAN#egg=GFPGAN

RUN git clone https://github.com/mallorbc/stable-diffusion-klms-gui.git \
&& mv stable-diffusion-klms-gui /app


RUN cd /app \
&& pip install -e .

RUN mkdir -p /app/src/gfpgan/experiments/pretrained_models/

RUN wget https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth -O /app/src/gfpgan/experiments/pretrained_models/GFPGANv1.3.pth


CMD [ "python", "/app/scripts/web_gui.py" ]