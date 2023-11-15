FROM bitnami/wordpress:${TAG_NAME:-latest}

## Change user to perform privileged actions
USER 0
## Install 'phpX.X-imap'
RUN apt-get update && apt-get install wget gnupg -y && \
    echo "deb https://packages.sury.org/php/ bullseye main" | tee /etc/apt/sources.list.d/sury-php.list && \
    wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - && \
    apt-get update && apt-get install php8.2-imap -y && \
    sed -i 's/;extension=imap/extension=\/usr\/lib\/php\/20220829\/imap.so/g;' /opt/bitnami/php/etc/php.ini

## Revert to the original non-root user
USER 1001
