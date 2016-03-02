FROM felix/openjdk
RUN echo 2016-03-02
RUN apt-get update
RUN apt-get install -y curl make git ruby rake tree

# Set the default locale to UTF-8
RUN locale-gen en_US.UTF-8
RUN echo "LANG=en_US.UTF-8" >> /etc/default/locale

WORKDIR /workspace
VOLUME "/workspace"

# Install logstash 2.1.0 into /usr/local/logstash-2.1.0
RUN mkdir -p /usr/local/logstash-2.2.0
RUN curl -L https://download.elastic.co/logstash/logstash/logstash-all-plugins-2.2.0.tar.gz | tar xz -C /usr/local/logstash-2.2.0 --strip-components 1
RUN ( cd /usr/local/logstash-2.2.0 && bin/plugin install --development )
