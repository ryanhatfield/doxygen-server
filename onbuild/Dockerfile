FROM ryanhatfield/doxygen-server:latest

MAINTAINER Ryan Hatfield <ryan@ryan.bio>

# Create the source folder
RUN mkdir -p /usr/src/app/source /usr/src/app/build
WORKDIR /usr/src/app/source

# Copy the local directory to the docker image
ONBUILD COPY . /usr/src/app/source

# First, check that the Dockerfile exists,
# then override the OUTPUT_DIRECTORY and HTML_OUTPUT config options
ONBUILD RUN if [[ ! -f Doxyfile ]]; then echo "Doxyfile not found."; exit 1; fi && \
        echo "OUTPUT_DIRECTORY = ../build" >> Doxyfile && \
        echo "HTML_OUTPUT = html" >> Doxyfile

# Run the doxygen command
ONBUILD RUN doxygen

# Switch the working directory to the html output folder
ONBUILD WORKDIR /usr/src/app/build/html

# Expose the web port
EXPOSE 8080

CMD [ "/usr/bin/python3", "-m", "http.server", "8080" ]
