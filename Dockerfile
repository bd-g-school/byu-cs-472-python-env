FROM python:3.8-slim

WORKDIR ./
COPY requirements.txt .
RUN pip3 install -r requirements.txt
