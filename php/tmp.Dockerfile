FROM php:8.4-apache

RUN docker-php-ext-install pdo mysqli pdo_mysql