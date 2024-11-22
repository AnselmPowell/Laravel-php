From php:8.2-apache
COPY  myapp/ /var/www/html
WORKDIR var/www/html/
RUN  docker-php-ext-install pdo pdo_mysql
EXPOSE 5000

