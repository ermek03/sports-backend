FROM python:3.7.2
ENV PYTHONUNBUFFERED 1

WORKDIR /app5
RUN pip install --upgrade pip

COPY requirements.txt /app5/
RUN pip install -r /app5/requirements.txt

ADD . /app5/