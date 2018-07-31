FROM ubuntu:18.04

MAINTAINER Anton Lebedev <mailbox@lebster.me>

# Install required gnupg package
RUN apt-get update && apt-get -y install gnupg

# Install required ca-certificates to prevent the error in the certificate verification
RUN apt-get -y install ca-certificates && update-ca-certificates

# Import the public key used by the package management system
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4

# Create a list file for MongoDB
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

# Reload local package database
RUN apt-get update

# Install the MongoDB packages
RUN apt-get -y install mongodb-org-shell
RUN apt-get -y install mongodb-org-tools

# Install Cron
RUN apt-get -y install cron

COPY /dropbox_uploader /opt/dropbox_uploader
COPY /scripts /opt/scripts
RUN chmod -R +x /opt/scripts

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab

# Making the crontab file based on env vars and put to the cron directory
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Run the command on container startup
CMD ["cron", "-f"]
