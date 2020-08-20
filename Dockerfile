FROM php:7.0-apache
MAINTAINER cicerorod@gmail.com

RUN apt-get update && apt-get install -y vim && apt-get install -y git
RUN docker-php-ext-install pdo pdo_mysql