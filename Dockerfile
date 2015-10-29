# Using the Ubuntu BaseImage from Phusion
# http://phusion.github.io/baseimage-docker/
FROM phusion/baseimage:0.9.17

MAINTAINER Ryan Hatfield <ryan@ryan.bio>

# Get Doxygen version 1.8.6-2
RUN apt-get update
RUN apt-get install -y doxygen=1.8.6-2

# Verify version
RUN /bin/bash -c "if [[ \"$(doxygen --version)\" =~ ^1\.8\.6 ]]; then echo \"Version 1.8.6\"; else echo \"Version not right!\"; exit 1; fi"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
