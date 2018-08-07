FROM centos:7.2.1511

MAINTAINER MENGXUN

RUN yum install -y epel-release \
        python36u \
        python36u-pip \
        nginx \
        supervisor \
        sqlite3i && \
    ln -s /bin/python3.6 /bin/python3 && \
    ln -s /bin/pip3.6 /bin/pip3

RUN pip3 install uwsgi

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
COPY nginx-app.conf /etc/nginx/sites-available/default
COPY supervisor-app.conf /etc/supervisor/conf.d/

RUN pip3 install -r /home/docker/code/app/requirements.txt

COPY . /home/docker/code/

EXPOSE 80
CMD ["supervisord", "-n"]
