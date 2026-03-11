FROM ubuntu
RUN apt update -y && apt install nginx -y
COPY . /var/www/html
ENTRYPOINT ["ngnix","-g","daemon off;"]
