FROM bitnami/wordpress:${TAG_NAME:-latest}

## Change user to perform privileged actions
USER 0
## Install 'phpX.X-imap'
RUN apt update
RUN install_packages php8.2-imap
## Revert to the original non-root user
USER 1001
