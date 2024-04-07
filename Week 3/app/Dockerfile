FROM python:3.13.0a5-alpine3.19
COPY . /application
WORKDIR /application
# ENV NAME=bar
# ADD https://github.com/dotcloud/docker/archive/master.tar.gz  .
# RUN apt-get update
# RUN tar -xvf master.tar.gz
# COPY requirements.txt .
RUN pip install -r requirements.txt
EXPOSE 5001
CMD ["python", "app.py"]