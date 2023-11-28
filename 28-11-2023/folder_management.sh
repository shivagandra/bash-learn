#!/bin/bash

# Your deployment script

echo "Enter Version Number: "
read NEW_VERSION

# Create a new folder for the updated version
mkdir -p /var/www/html/app/$NEW_VERSION

# Copy or deploy your application to the new folder

# Update the Apache virtual host configuration
echo "
<VirtualHost *:80>
    ServerName $NEW_VERSION.yourdomain.com
    DocumentRoot /var/www/html/app/$NEW_VERSION
</VirtualHost>
" > /etc/apache2/sites-available/$NEW_VERSION.conf

# Enable the new virtual host
a2ensite $NEW_VERSION.conf

# Reload Apache to apply changes
systemctl reload apache2

# Remove old versions if all customers have upgraded
# Add logic to check if all customers are upgraded to the latest version
if [ $ALL_CUSTOMERS_UPGRADED ]; then
    # Delete old version folders
    rm -rf /var/www/html/app/v1
    rm -rf /var/www/html/app/v2
    # Update Apache virtual host configurations accordingly
    a2dissite v1.conf
    a2dissite v2.conf
    systemctl reload apache2
fi
