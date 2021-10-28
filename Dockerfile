FROM python:3.8-slim

WORKDIR ./
COPY install-graphviz.sh .
RUN ./install-graphviz.sh

COPY requirements.txt .
RUN pip3 install -r requirements.txt
