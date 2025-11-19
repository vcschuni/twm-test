FROM php:8.2-apache

# Copy public folder
COPY public/ /var/www/html/

# Optional: enable mod_rewrite
RUN a2enmod rewrite

# Configure Apache to run on port 8080 (OpenShift allows this)
RUN sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf \
    && sed -i 's/:80>/:8080>/' /etc/apache2/sites-enabled/000-default.conf

# Expose port 8080
EXPOSE 8080

# Start Apache in the foreground
CMD ["apache2-foreground"]
