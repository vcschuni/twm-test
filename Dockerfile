# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Copy the public folder into Apache document root
COPY public/ /var/www/html/

# Make sure permissions are correct for OpenShift non-root
RUN chown -R www-data:0 /var/www/html && chmod -R 755 /var/www/html

# Enable mod_rewrite if needed
RUN a2enmod rewrite

# Change Apache to listen on 8080 (OpenShift requires non-root)
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
RUN sed -i 's/:80>/:8080>/' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2-foreground"]
