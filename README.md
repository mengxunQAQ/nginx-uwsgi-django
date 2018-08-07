# Django, uWSGI and Nginx with Docker

### Introduction

The workflow is like: `nginx-->uwsgi-->django` and via supervisor management process


### QuickStart

- git clone https://github.com/mengxunQAQ/nginx-uwsgi-django.git
- cd nginx-uwsgi-django
- sudo docker build -t webapp .
- sudo docker run -d -p 80:80 webapp


### Usage

if you want run your own application, you can do the following:
- First, move your django project to the `app` directory
- Then, modify the `uwsgi.ini` like this:
    - The `base` section at the bottom of the file is state the location of your wsgi.py. you will need to make sure the python path to the wsgi.py file is relative to that.
