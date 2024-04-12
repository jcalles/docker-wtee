FROM python:3.8.19-alpine3.19

MAINTAINER Javier Calles "javiercalles@gmail.com"
ENV TRUSTED_HOST="--trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org"

# Install required packages
RUN apk update && \
    apk add --no-cache \
        wget \
        coreutils \
        binutils \
        bash && \
    pip install $TRUSTED_HOST wtee

# Set the working directory
WORKDIR /app

# Copy the entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /docker-entrypoint.sh

# Define environment variables
ARG LOGPATH
ENV LOGPATH=$LOGPATH

# Define the entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]

