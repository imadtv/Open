FROM php:8.1-apache

# تثبيت الامتدادات المطلوبة
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip \
    && docker-php-ext-install mysqli pdo pdo_mysql gd zip

# تحميل OGP
RUN curl -L -o /tmp/ogp.zip https://github.com/OpenGamePanel/OGP-Files/releases/latest/download/OGP.zip \
    && unzip /tmp/ogp.zip -d /var/www/html/ \
    && rm /tmp/ogp.zip

# تغيير صلاحيات الملفات
RUN chown -R www-data:www-data /var/www/html/
