# python runtime
FROM python:3.8.1-alpine

# maintainer
MAINTAINER Justin Miller <justinrmiller@gmail.com>

# working directory
WORKDIR /app

# copy current directory into the container
ADD . /app

# install requirements
RUN pip3 install -r requirements.txt

# make port 8000 available to the world outside
EXPOSE 8000

CMD ["gunicorn", "--config", "./config/gunicorn_config.py", "src:app"]