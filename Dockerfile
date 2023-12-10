FROM jupyter/pyspark-notebook:latest

USER root

# Environments
ENV LANG=C.UTF-8
ENV TZ=Azia/Tokyo

# requirements install
RUN apt-get update && \
    apt-get install -y curl less vim curl unzip sudo

# Use Jupyter Lab 7
RUN pip install -U jupyter

# pyspark logging setting
# COPY ./log4j.properties /usr/local/spark/conf/log4j2.properties

# for awscli
# https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-linux.html
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN sudo ./aws/install


# clean
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER jovyan

# python requirements install
# COPY ./requirements.txt .
# RUN pip install -r requirements.txt

WORKDIR /home/jovyan/work
