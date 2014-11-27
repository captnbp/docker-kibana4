# Kibana Dockerfile

This is a highly configurable Libana (4.0.0 Beta 2) image.

### Linked container running Elasticsearch

If you want to link to container running Elasticsearch rather than use the embedded Elasticsearch server:

    $ docker run -d \
      -v *yourKibanaConfFolder*:/data \
      --link <your_es_container_name>:es \
      -p 5601:5601 \
      captnbp/docker-kibana4

To have the linked Elasticsearch container's `bind_host` and `port` automatically detected, you will need to create an `ES_HOST` and `ES_PORT` placeholder in the `elasticsearch` definition in your Kibana config file.

### External Elasticsearch server

If you are using an external Elasticsearch server rather than the embedded server or a linked container, simply provide a configuration file with the Elasticsearch endpoints already configured:

    $ docker run -d \
      -v *yourKibanaConfFolder*:/data \
      -p 5601:5601 \
      captnbp/docker-kibana

### Finally, verify the installation

You can now verify the Kibana's installation by visiting the prebuilt Kibana dashboard:

    http://<your_container_ip>:5601

## Optional, build and run the image from source

If you prefer to build from source rather than use the [captnbp/docker-kibana4][1] trusted build published to the public Docker Registry, execute the following:

    $ git clone https://github.com/captnbp/docker-kibana4.git
    $ cd docker-kibana4
    $ docker build -t captnbp/docker-kibana4 .
