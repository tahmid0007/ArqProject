FROM ubuntu:bionic

WORKDIR /app
COPY environment.yml /tmp/


RUN apt update -y && apt install -y wget build-essential

# install miniconda
ENV MINICONDA_VERSION 4.9.2
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-py38_$MINICONDA_VERSION-Linux-x86_64.sh -O ~/miniconda.sh && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b && \
    rm ~/miniconda.sh

ENV PATH=/root/miniconda3/bin:$PATH

COPY . .

RUN conda env create -f /tmp/environment.yml

ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "ds-nlp-demo-sentiment-analysis", "python", "app.py"]

