# Use official PHP 8.2 with Apache
FROM php:8.2-apache

# Copy your public folder to Apache's web root
COPY public/ /var/www/html/

# Optional: enable Apache mod_rewrite
RUN a2enmod rewrite
