FROM ubuntu:latest

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

# Install PyYAML
RUN pip3 install PyYAML

# Copy the feed.py script to the appropriate location
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script and ensure it is executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
