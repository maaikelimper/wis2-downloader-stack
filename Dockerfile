# Use an official Python runtime as a parent image
FROM python:3.9-slim

# install the latest version of the package
RUN pip install https://github.com/wmo-im/wis2-downloader/archive/main.zip

# Run wis2-downloader when the container launches
CMD ["wis2downloader","--config","/config/config.json"]