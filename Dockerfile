FROM java:7-jre
MAINTAINER Benoît Pourre <benoit.pourre@gmail.com>

# Download version 4.0.0 Beta 2 of kibana 4
RUN cd /tmp && \
    wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA2.tar.gz && \
    tar -xzvf ./kibana-4.0.0-BETA2.tar.gz && \
    mv ./kibana-4.0.0-BETA2 /opt/kibana && \
    rm ./kibana-4.0.0-BETA2.tar.gz

# Copy build files to container root
RUN mkdir /app
ADD . /app

# Kibana
EXPOSE 5601

# Volume for Kibana's conf file
VOLUME /data

# Start kibana
ENTRYPOINT ["/app/kibana"]
