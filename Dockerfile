FROM ubuntu:14.04

MAINTAINER ch.tang@qtmedical.com

RUN apt-get update

RUN apt-get install -y python-pip python-dev

RUN pip install flask

RUN pip install uwsgi

RUN apt-get install -y nginx

RUN apt-get install -y supervisor

ADD . /home/docker/


RUN rm /etc/nginx/sites-enabled/default

RUN ln -s /home/docker/nginx-app.conf /etc/nginx/sites-enabled/

RUN ln -s /home/docker/supervisor-app.conf /etc/supervisor/conf.d/

EXPOSE 80 443 5000 8000

CMD ["supervisord", "-n"]
