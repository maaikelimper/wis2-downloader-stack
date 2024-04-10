# Use an official Python runtime as a parent image
FROM python:3.9-slim

# update pyopenssl and pin requests and urllib3 to avoid SSL error
RUN pip install pyopenssl --upgrade && pip install requests==2.26.0 urllib3==1.26.0

# install the latest version of the package
RUN pip install https://github.com/wmo-im/wis2-downloader/archive/main.zip

# Run wis2-downloader when the container launches
CMD ["wis2downloader","--config","/config/config.json"]