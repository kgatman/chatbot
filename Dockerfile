FROM ollama/ollama

WORKDIR /var/lib/chatbot

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# updating the image and installing python and dependencies
RUN apt update && apt upgrade -y && apt install python3 -y && apt install python3-pip -y && apt install git -y

RUN apt install curl -y

# installing ollama for DeepSeek
# RUN curl -fsSL https://ollama.com/install.sh | sh && ollama --version

# enabling ollama
# RUN systemctl start ollama && systemctl enable ollama

RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
| gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

RUN curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
| sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
| tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

RUN get update

RUN apt install -y nvidia-container-toolkit

# starting ollama
RUN nohup ollama serve > ollama.log 2>&1 &

# downloading and running the DeepSeek model
RUN ollama run deepseek-r1:7b && ollama list

RUN apt install python3-venv && python3 -m venv ~/open-webui-venv && source ~/open-webui-venv/bin/activate

# installing Open WebUI
RUN pip install open-webui

RUN open-webui serve
EXPOSE 8080

# CMD [ "python", "./your-daemon-or-script.py" ]

