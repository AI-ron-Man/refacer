FROM python:3
ARG REQUIREMENTS_FILE=./requirements.txt

RUN apt update && apt install -y \ 
    ffmpeg

WORKDIR /refacer

ADD https://huggingface.co/deepinsight/inswapper/resolve/main/inswapper_128.onnx .

COPY $REQUIREMENTS_FILE /tmp/pip-tmp/requirements.txt
RUN pip3 --disable-pip-version-check --no-cache-dir install -r /tmp/pip-tmp/requirements.txt && rm -rf /tmp/pip-tmp

EXPOSE 7860/tcp

COPY . .
ENTRYPOINT ["python"]
CMD ["app.py", "--server_name", "0.0.0.0"] 
