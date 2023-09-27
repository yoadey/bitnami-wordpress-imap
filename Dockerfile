FROM bitnami/wordpress:6.3.1

## Change user to perform privileged actions
USER 0
## Install 'phpX.X-imap'
RUN install_packages php-imap
## Revert to the original non-root user
USER 1001
