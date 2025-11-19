# Use official PHP 8.2 Apache image
FROM php:8.2-apache

# Copy the public folder into Apache document root
COPY public/ /var/www/html/

# Optional: enable mod_rewrite
RUN a2enmod rewrite

# Change Apache to listen on port 8080 (required for OpenShift non-root)
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
    && sed -i 's/:80>/:8080>/' /etc/apache2/sites-enabled/000-default.conf

# Expose port 8080 to OpenShift
EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2-foreground"]
