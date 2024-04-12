# Use an official Python runtime as a parent image
FROM python:3.9-slim

EXPOSE 8080

# define env variable for DOWNLOAD_DIR
ENV DOWNLOAD_DIR /app/downloads

# update pyopenssl and pin requests and urllib3 to avoid SSL error
RUN pip install pyopenssl --upgrade && pip install requests==2.26.0 urllib3==1.26.0
# install cron
RUN apt-get update && apt-get install -y cron

# install the latest version of the package
RUN pip install https://github.com/wmo-im/wis2-downloader/archive/rory-changes.zip

# Set the working directory to /app
WORKDIR /app

# Copy the clean-script to the Docker image
COPY clean.py /app/clean.py

# add wis2box.cron to crontab
COPY ./docker/clean.cron /etc/cron.d/clean.cron

# set permissions for the cron job and install it
RUN chmod 0644 /etc/cron.d/clean.cron && crontab /etc/cron.d/clean.cron

# Copy the entrypoint script to the Docker image
COPY ./docker/entrypoint.sh /entrypoint.sh

# set permissions for the entrypoint script
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# Run wis2-downloader when the container launches
CMD ["wis2downloader","--config","/config/config.json"]